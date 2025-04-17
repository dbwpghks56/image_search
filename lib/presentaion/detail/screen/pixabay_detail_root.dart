import 'package:flutter/material.dart';
import 'package:image_search/presentaion/detail/pixabay_detail_view_model.dart';
import 'package:image_search/presentaion/detail/screen/pixabay_detail_screen.dart';

class PixabayDetailRoot extends StatelessWidget {
  final PixabayDetailViewModel viewModel;
  final int id;
  const PixabayDetailRoot({
    super.key,
    required this.viewModel,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel..findPixabayById(id),
      builder: (context, _) {
        return PixabayDetailScreen(state: viewModel.value);
      },
    );
  }
}
