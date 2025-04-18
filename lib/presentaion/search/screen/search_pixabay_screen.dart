import 'package:flutter/material.dart';
import 'package:image_search/core/presentation/component/image_tile.dart';
import 'package:image_search/core/presentation/component/search_input.dart';
import 'package:image_search/presentaion/search/search_pixabay_state.dart';

class SearchPixabayScreen extends StatelessWidget {
  final SearchPixabayState state;
  final void Function() onSearchClick;
  final void Function(int value) onTileClick;
  final TextEditingController controller;
  const SearchPixabayScreen({
    super.key,
    required this.state,
    required this.onSearchClick,
    required this.onTileClick,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 24,
            children: [
              SearchInput(
                controller: controller,
                icon: GestureDetector(
                  onTap: onSearchClick,
                  child: Icon(Icons.search, color: Colors.cyan),
                ),
                placeholder: 'Search',
              ),
              Expanded(
                child:
                    state.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : state.pixabaies.isNotEmpty
                        ? GridView.builder(
                          itemCount: state.pixabaies.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 34,
                                crossAxisSpacing: 34,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                onTileClick(state.pixabaies[index].id);
                              },
                              child: ImageTile(
                                image: state.pixabaies[index].imageUrl,
                              ),
                            );
                          },
                        )
                        : Center(
                          child: Text(
                            '검색 결과가 없습니다.',
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
