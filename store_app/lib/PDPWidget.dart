import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final Runtime _runtime = Runtime();
  final DynamicContent _data = DynamicContent();

  static const LibraryName coreName = LibraryName(<String>['core', 'widgets']);
  static const LibraryName mainName = LibraryName(<String>['main']);

  @override
  void initState() {
    super.initState();

    _runtime.update(coreName, createCoreWidgets());

    final encodedData =
        "/lJGVwEAAAAAAAAAAgAAAAAAAAAEAAAAAAAAAGNvcmUHAAAAAAAAAHdpZGdldHMBAAAAAAAAAAQAAAAAAAAAcm9vdAAAAAAAAAAACQkAAAAAAAAAQ29udGFpbmVyAgAAAAAAAAAFAAAAAAAAAGNvbG9yAhEiAP8AAAAABQAAAAAAAABjaGlsZAkGAAAAAAAAAENlbnRlcgEAAAAAAAAABQAAAAAAAABjaGlsZAkEAAAAAAAAAFRleHQDAAAAAAAAAAQAAAAAAAAAdGV4dAUDAAAAAAAAAAQHAAAAAAAAAEhlbGxvLCALAgAAAAAAAAAEBQAAAAAAAABncmVldAQEAAAAAAAAAG5hbWUEAQAAAAAAAAAhBQAAAAAAAABzdHlsZQcCAAAAAAAAAAUAAAAAAAAAY29sb3IC/////wAAAAAIAAAAAAAAAGZvbnRTaXplAhQAAAAAAAAADQAAAAAAAAB0ZXh0RGlyZWN0aW9uBAMAAAAAAAAAbHRy";
    final data = base64Decode(encodedData);
    final remoteLibrary = decodeLibraryBlob(data);

    _runtime.update(mainName, remoteLibrary);

    _data.update('greet', <String, Object>{'name': 'Stranger'});
  }

  @override
  Widget build(BuildContext context) {
    return RemoteWidget(
      runtime: _runtime,
      data: _data,
      widget: const FullyQualifiedWidgetName(mainName, 'root'),
      onEvent: (String name, DynamicMap arguments) {
        debugPrint('user triggered event "$name" with data: $arguments');
      },
    );
  }
}
