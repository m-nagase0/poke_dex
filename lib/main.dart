
import 'package:flutter/material.dart';
import 'package:poke_picture_book/view/home_page.dart';
import 'package:poke_picture_book/viewmodel/poke_data_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<PokeDataViewModel>(
      create: (context) => PokeDataViewModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokePictorialBook",
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: HomePage(),
    );
  }
}
