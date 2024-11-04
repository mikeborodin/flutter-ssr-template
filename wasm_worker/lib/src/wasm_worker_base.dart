import 'post_dto.dart';

import 'package:fetch_api/fetch_api.dart';

class WasmWorker {
  Future<List<PostDto>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      final response = await fetch(url);

      final json = await response.json() as List<Object?>;
      final posts = json
          .map(
            (e) => PostDto.fromJson((e!.toJSONCompatibleObject())),
          )
          .toList();
      return posts;
    } catch (error) {
      print('-> Error: $error');
    }

    return [];
  }
}

extension JSONMapping on Object {
  Map<String, Object?> toJSONCompatibleObject() {
    return (this as Map<Object?, Object?>)
        .map((key, value) => MapEntry(key! as String, value));
  }
}
