import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rfw/rfw.dart';

import 'components/components.dart';

class DynamicScreen extends HookConsumerWidget {
  final String config;
  const DynamicScreen({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runtime = useMemoized(() => Runtime());
    final content = useMemoized(() => DynamicContent());
    final local = useMemoized(() => const LibraryName(['local']));
    final remote = useMemoized(() => const LibraryName(['remote']));
    final core = useMemoized(() => const LibraryName(['core']));

    final widget = useMemoized(
      () => decodeLibraryBlob(
        base64Decode(config),
      ),
    );

    useEffect(() {
      // enabling flutter core widgets so the Server can send Column, Row etc.
      runtime.update(core, createCoreWidgets());

      // enabling our custom widgets.
      runtime.update(local, localComponentsLibrary());
      runtime.update(remote, widget);

      return runtime.dispose;
    }, []);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: RemoteWidget(
            runtime: runtime,
            onEvent: (eventName, eventArguments) {
              log('$eventName $eventArguments');
            },
            widget: FullyQualifiedWidgetName(
              remote,
              'root',
            ),
            data: content,
          ),
        ),
      ),
    );
  }
}
