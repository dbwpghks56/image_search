import 'package:go_router/go_router.dart';
import 'package:image_search/core/di/di_setup.dart';
import 'package:image_search/core/routing/routes.dart';
import 'package:image_search/presentaion/detail/screen/pixabay_detail_root.dart';
import 'package:image_search/presentaion/search/screen/search_pixabay_root.dart';
import 'package:image_search/presentaion/search/search_pixabay_view_model.dart';

import '../../presentaion/detail/pixabay_detail_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.search,
  routes: [
    GoRoute(
      path: Routes.search,
      builder: (context, state) {
        return SearchPixabayRoot(
          viewModel: getIt<SearchPixabayViewModel>(),
          onTileClick: (int value) {
            context.push('${Routes.detail}/$value');
          },
        );
      },
    ),
    GoRoute(
      path: '${Routes.detail}/:id',
      builder: (context, state) {
        final int id = int.parse(state.pathParameters['id']!);

        return PixabayDetailRoot(
          viewModel: getIt<PixabayDetailViewModel>(),
          id: id,
        );
      },
    ),
  ],
);
