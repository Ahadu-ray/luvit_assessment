import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_models.freezed.dart';
part 'firebase_models.g.dart';

@freezed
class DateCardData with _$DateCardData {
  const factory DateCardData({
    required int age,
    required String description,
    required List<String> images,
    required int likeCount,
    required String location,
    required String name,
    required List<String> tags,
  }) = _DateCardData;

  factory DateCardData.fromJson(Map<String, dynamic> json) =>
      _$DateCardDataFromJson(json);
}
