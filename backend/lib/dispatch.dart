import 'dart:convert';
import 'dart:js_interop';

import 'package:rfw/formats.dart';
import 'package:shared/shared.dart';

import 'src/wasm_worker_base.dart';

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
      final homeTab = parseLibraryFile('''
      import local;
      import core;

      widget root = Column(
        children: [
            WelcomeText(),
            SizedBox(height: 8),
            LessonOfTheDay(),
            SizedBox(height: 8),
            TromboneImage(),
            SizedBox(height: 8),
            PromocodeBanner(couponCode: 'REALCODE50'),
            TextAndDescription(
                title: 'Black Friday is Coming',
                description: 'Please be prepared'),
            // does not work:
            // CountdownWidget(
            //   imageUrl:
            //       'https://images.unsplash.com/photo-1716841670208-b08fc68993e5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dHJvbWJvbmV8ZW58MHx8MHx8fDA%3D',
            //   targetDate: DateTime(2024, 11, 12, 21),
            // ),
            YoutubeVideo(
              url: 'https://www.youtube.com/watch?v=l3XuJ7TztVg',
            ),
            TromboneNotesWidget(),
            NewBadge(
              child: SizedBox(
                height: 200,
                child: TromboneImage(),
              ),
            ),
            PromoBanner(
                message: 'Did you practice today?',
                ctaText: 'YES',
                link: 'https://google.com'),
        ]
      );
      ''');

      final encodedJson = jsonEncode(
        AppLayouts(
          home: _encoded(homeTab),
          videos: _encoded(homeTab),
        ).toJson(),
      );

      return encodedJson.toJS;

    default:
      return "Hey, I don't know this instruction".toJS;
  }
}

String _encoded(RemoteWidgetLibrary remoteWidgets) {
  final blob = encodeLibraryBlob(remoteWidgets);
  final encodedBlob = base64Encode(blob);
  return encodedBlob;
}
