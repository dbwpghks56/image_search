import 'package:flutter/material.dart';
import 'package:image_search/presentaion/detail/pixabay_detail_state.dart';

class PixabayDetailScreen extends StatelessWidget {
  final PixabayDetailState state;
  const PixabayDetailScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          state.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 428,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(state.pixabay.largeImageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24,
                      children: [
                        Text(
                          'user: ${state.pixabay.user}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'tags: ${state.pixabay.tags.toString().replaceAll('[', '').replaceAll(']', '')}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
