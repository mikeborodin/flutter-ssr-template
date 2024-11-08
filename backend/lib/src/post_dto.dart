import 'package:json/json.dart';

@JsonCodable()
class PostDto {
  final double id;
  final double userId;
  final String title;
  final String body;
}
