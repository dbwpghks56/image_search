import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/core/utils/http/http_url.dart';
import 'package:image_search/data/dto/pixabay_dto.dart';
import 'package:image_search/domain/data_source/pixabay_data_source.dart';

class PixabayDataSourceImpl implements PixabayDataSource {
  @override
  Future<List<PixabayDto>> findPixabayDtos(String query) async {
    try {
      final response = await http
          .get(
            Uri.parse('${HttpUrl.baseUrl}&q=$query&image_type=photo'),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw PixabayError.timeOutError;
            },
          );

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final List<dynamic> data = json['hits'];

        return data
            .map((e) => PixabayDto.fromJson(e as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 404) {
        throw PixabayError.notFoundError;
      } else {
        throw PixabayError.networkError;
      }
    } catch (e) {
      throw PixabayError.networkError;
    }
  }

  @override
  Future<PixabayDto> findPixbatDtoById(int id) async {
    try {
      final response = await http
          .get(
            Uri.parse('${HttpUrl.baseUrl}&id=$id'),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw PixabayError.timeOutError;
            },
          );

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final List<dynamic> data = json['hits'];

        return data
            .map((e) => PixabayDto.fromJson(e as Map<String, dynamic>))
            .toList()
            .first;
      } else if (response.statusCode == 404) {
        throw PixabayError.notFoundError;
      } else {
        throw PixabayError.networkError;
      }
    } catch (e) {
      throw PixabayError.networkError;
    }
  }
}
