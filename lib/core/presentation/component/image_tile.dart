import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String image;
  const ImageTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
