import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/domain/model/pixabay.dart';

part 'pixabay_detail_state.freezed.dart';

@freezed
abstract class PixabayDetailState with _$PixabayDetailState {
  const factory PixabayDetailState({
    @Default(
      Pixabay(
        id: -1,
        imageUrl: '정보없음',
        tags: [],
        user: '정보없음',
        largeImageURL: '정보없음',
      ),
    )
    final Pixabay pixabay,
    @Default(false) final bool isLoading,
    @Default(null) final PixabayError? error,
  }) = _PixabayDetailState;
}
