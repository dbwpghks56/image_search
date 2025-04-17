import 'package:flutter/foundation.dart';
import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/core/utils/result/result.dart';
import 'package:image_search/domain/model/pixabay.dart';
import 'package:image_search/domain/repository/pixabay_respository.dart';
import 'package:image_search/presentaion/search/search_pixabay_state.dart';

class SearchPixabayViewModel extends ValueNotifier<SearchPixabayState> {
  final PixabayRespository _respository;
  SearchPixabayViewModel(this._respository) : super(const SearchPixabayState());

  Future<void> findPixabiesByQuery(String query) async {
    value = value.copyWith(isLoading: true);
    final result = await _respository.findPixabays(query);

    switch (result) {
      case Success<List<Pixabay>, PixabayError>():
        value = value.copyWith(isLoading: false, pixabaies: result.success);
      case Error<List<Pixabay>, PixabayError>():
        value = value.copyWith(isLoading: false, error: result.error);
    }
  }
}
