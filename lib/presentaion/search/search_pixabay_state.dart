import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/core/utils/errors/pixabay_error.dart';
import 'package:image_search/domain/model/pixabay.dart';

part 'search_pixabay_state.freezed.dart';

@freezed
abstract class SearchPixabayState with _$SearchPixabayState {
  const factory SearchPixabayState({
    @Default([]) final List<Pixabay> pixabaies,
    @Default(false) final bool isLoading,
    @Default(null) final PixabayError? error,
  }) = _SearchPixabayState;
}
