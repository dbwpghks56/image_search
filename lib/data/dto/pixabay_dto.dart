import 'package:json_annotation/json_annotation.dart';

part 'pixabay_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PixabayDto {
  final int? id;
  final String? type;
  final String? user;
  final String? tags;
  final String? imageUrl;
  final String? largeImageURL;
  final String? previewURL;
  final double? imageWidth;
  final double? imageHeiht;
  final double? imageSize;

  const PixabayDto({
    required this.id,
    required this.type,
    required this.user,
    required this.tags,
    required this.imageUrl,
    required this.previewURL,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeiht,
    required this.imageSize,
  });

  factory PixabayDto.fromJson(Map<String, dynamic> json) =>
      _$PixabayDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayDtoToJson(this);
}
