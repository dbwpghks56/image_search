import 'package:get_it/get_it.dart';
import 'package:image_search/data/data_source/pixabay_data_source_impl.dart';
import 'package:image_search/data/repository/pixabay_repository_impl.dart';
import 'package:image_search/domain/data_source/pixabay_data_source.dart';
import 'package:image_search/domain/repository/pixabay_respository.dart';
import 'package:image_search/presentaion/detail/pixabay_detail_view_model.dart';
import 'package:image_search/presentaion/search/search_pixabay_view_model.dart';

final getIt = GetIt.instance;

void di() {
  getIt.registerSingleton<PixabayDataSource>(PixabayDataSourceImpl());
  getIt.registerSingleton<PixabayRespository>(PixabayRepositoryImpl(getIt()));
  getIt.registerFactory<PixabayDetailViewModel>(() {
    return PixabayDetailViewModel(getIt());
  });
  getIt.registerCachedFactory<SearchPixabayViewModel>(() {
    return SearchPixabayViewModel(getIt());
  });
}
