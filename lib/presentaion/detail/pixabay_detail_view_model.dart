import 'package:flutter/foundation.dart';
import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/core/utils/result/result.dart';
import 'package:image_search/domain/model/pixabay.dart';
import 'package:image_search/domain/repository/pixabay_respository.dart';
import 'package:image_search/presentaion/detail/pixabay_detail_state.dart';

class PixabayDetailViewModel extends ValueNotifier<PixabayDetailState> {
  final PixabayRespository _respository;

  PixabayDetailViewModel(this._respository) : super(const PixabayDetailState());

  Future<void> findPixabayById(int id) async {
    value = value.copyWith(isLoading: true);
    final result = await _respository.findPixabayById(id);

    switch (result) {
      case Success<Pixabay, PixabayError>():
        value = value.copyWith(isLoading: false, pixabay: result.success);
      case Error<Pixabay, PixabayError>():
        value = value.copyWith(isLoading: false, error: result.error);
    }
  }
}
