import 'dart:convert';
import 'dart:js_interop';
import 'src/wasm_worker_base.dart';
import 'package:rfw/formats.dart';

Future<JSString> dispatch(String url) async {
  final uri = Uri.parse(url);
  final worker = WasmWorker();

  print("Path: ${uri.path}");

  switch (uri.path) {
    case '/posts':
      var posts = await worker.fetchPosts();

      final filter = uri.queryParameters['filter'];
      if (filter != null && filter.isNotEmpty) {
        posts = posts.where((post) => post.title.contains(filter)).toList();
      }

      try {
        return "Loaded posts: ${posts.length}".toJS;
      } catch (error) {
        print("-> Error: $error");
      }
      return "Fail".toJS;
    case '/layout':
      final RemoteWidgetLibrary remoteWidgets = parseLibraryFile('''
        import core.widgets;
        
        widget root = Container(
          color: 0xFF002211,
          child: Center(
            child: Text(text: ["Hello, ", data.greet.name, "!"], style: { color: 0xFFFFFFFF, fontSize: 20 }, textDirection: "ltr"),
          ),
        );
      ''');
      final blob = encodeLibraryBlob(remoteWidgets);
      return base64Encode(blob).toJS;
    default:
      return "Hey, I don't know this instruction".toJS;
  }
}
