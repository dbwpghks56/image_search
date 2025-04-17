import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/core/utils/result/result.dart';
import 'package:image_search/data/dto/pixabay_dto.dart';
import 'package:image_search/data/mapper/pixabay_mapper.dart';
import 'package:image_search/domain/data_source/pixabay_data_source.dart';
import 'package:image_search/domain/model/pixabay.dart';
import 'package:image_search/domain/repository/pixabay_respository.dart';

class PixabayRepositoryImpl implements PixabayRespository {
  final PixabayDataSource _dataSource;

  PixabayRepositoryImpl(this._dataSource);

  @override
  Future<Result<Pixabay, PixabayError>> findPixabayById(int id) async {
    try {
      PixabayDto dto = await _dataSource.findPixbatDtoById(id);

      return Result.success(dto.toPixabay());
    } catch (error) {
      if (error is PixabayError) {
        switch (error) {
          case PixabayError.networkError:
            throw PixabayError.networkError;
          case PixabayError.notFoundError:
            throw PixabayError.notFoundError;
          case PixabayError.timeOutError:
            throw PixabayError.timeOutError;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Result<List<Pixabay>, PixabayError>> findPixabays(String query) async {
    try {
      List<PixabayDto> dtos = await _dataSource.findPixabayDtos(query);

      return Result.success(dtos.map((e) => e.toPixabay()).toList());
    } catch (error) {
      if (error is PixabayError) {
        switch (error) {
          case PixabayError.networkError:
            throw PixabayError.networkError;
          case PixabayError.notFoundError:
            throw PixabayError.notFoundError;
          case PixabayError.timeOutError:
            throw PixabayError.timeOutError;
        }
      } else {
        rethrow;
      }
    }
  }
}
