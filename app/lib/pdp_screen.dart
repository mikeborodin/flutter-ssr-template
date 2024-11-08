import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_app/fetch_config.dart';

const coreName = LibraryName(['core', 'widgets']);
const mainName = LibraryName(['main']);

class PdpScreen extends HookConsumerWidget {
  const PdpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runtime = useMemoized(() => Runtime());
    final data = useMemoized(() => DynamicContent());
    final configFuture = useMemoized(() => fetchConfig());
    final future = useFuture(configFuture);

    _init(
      runtime,
      data,
      future.data,
    );

    if (future.data != null) {
      return RemoteWidget(
        runtime: runtime,
        data: data,
        widget: const FullyQualifiedWidgetName(mainName, 'root'),
        onEvent: (String name, DynamicMap arguments) {
          debugPrint('user triggered event "$name" with data: $arguments');
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void _init(Runtime runtime, DynamicContent data, String? config) {
    useEffect(
      () {
        runtime.update(coreName, createCoreWidgets());

        if (config == null) return;

        final dataBytes = base64Decode(config);
        final remoteLibrary = decodeLibraryBlob(dataBytes);

        runtime.update(mainName, remoteLibrary);

        data.update('greet', {
          'name': 'Stranger',
        });

        return null;
      },
      [config],
    );
  }
}
