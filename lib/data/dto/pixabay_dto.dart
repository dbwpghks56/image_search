import 'package:json_annotation/json_annotation.dart';

part 'pixabay_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class Pixabay {
  final int? id;
  final String? type;
  final String? user;
  final String? tags;
  final String? imageUrl;
  final double? imageWidth;
  final double? imageHeiht;
  final double? imageSize;

  const Pixabay({
    required this.id,
    required this.type,
    required this.user,
    required this.tags,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeiht,
    required this.imageSize,
  });

  factory Pixabay.fromJson(Map<String, dynamic> json) =>
      _$PixabayFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayToJson(this);
}
