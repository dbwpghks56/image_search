import 'package:image_search/data/dto/pixabay_dto.dart';

abstract interface class PixabayDataSource {
  Future<List<PixabayDto>> findPixabayDtos(String query);
  Future<PixabayDto> findPixbatDtoById(int id);
}
