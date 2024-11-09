import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_layouts.freezed.dart';
part 'app_layouts.g.dart';

@freezed
class AppLayouts with _$AppLayouts {
  const factory AppLayouts({
    String? home,
    String? videos,
  }) = _AppLayouts;

  factory AppLayouts.fromJson(Map<String, dynamic> json) =>
      _$AppLayoutsFromJson(json);
}
