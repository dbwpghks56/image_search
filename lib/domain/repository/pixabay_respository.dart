import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/core/utils/result/result.dart';
import 'package:image_search/domain/model/pixabay.dart';

abstract interface class PixabayRespository {
  Future<Result<List<Pixabay>, PixabayError>> findPixabays(String query);
  Future<Result<Pixabay, PixabayError>> findPixabayById(int id);
}
