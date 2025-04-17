import 'package:flutter/material.dart';
import 'package:image_search/core/presentation/component/search_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: SearchInput(
            controller: TextEditingController(),
            icon: Icon(Icons.search, color: Colors.cyan),
            placeholder: 'Search',
          ),
        ),
      ),
    );
  }
}
