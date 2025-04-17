import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay.freezed.dart';

@freezed
abstract class Pixabay with _$Pixabay {
  const factory Pixabay({
    required int id,
    required List<String> tags,
    required String imageUrl,
    required String largeImageURL,
    required String user,
  }) = _Pixabay;
}
