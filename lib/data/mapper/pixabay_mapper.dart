import 'package:image_search/data/dto/pixabay_dto.dart';
import 'package:image_search/domain/model/pixabay.dart';

extension PixabayMapper on PixabayDto {
  Pixabay toPixabay() {
    return Pixabay(
      id: id ?? -1,
      imageUrl: imageUrl ?? '정보없음',
      tags: tags?.split(',') ?? [],
      user: user ?? '정보없음',
    );
  }
}
