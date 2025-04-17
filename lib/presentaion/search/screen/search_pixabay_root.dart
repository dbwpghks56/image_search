import 'package:flutter/material.dart';
import 'package:image_search/presentaion/search/screen/search_pixabay_screen.dart';
import 'package:image_search/presentaion/search/search_pixabay_view_model.dart';

class SearchPixabayRoot extends StatefulWidget {
  final SearchPixabayViewModel viewModel;
  final void Function(int value) onTileClick;
  const SearchPixabayRoot({
    super.key,
    required this.viewModel,
    required this.onTileClick,
  });

  @override
  State<SearchPixabayRoot> createState() => _SearchPixabayRootState();
}

class _SearchPixabayRootState extends State<SearchPixabayRoot> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return SearchPixabayScreen(
          state: widget.viewModel.value,
          onSearchClick: () {
            widget.viewModel.findPixabiesByQuery(_controller.text);
          },
          onTileClick: widget.onTileClick,
          controller: _controller,
        );
      },
    );
  }
}
