
import 'package:flutter/material.dart';
import 'package:poke_picture_book/view/home_page.dart';
import 'package:poke_picture_book/viewmodel/change_looks_view_model.dart';
import 'package:poke_picture_book/viewmodel/poke_data_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => PokeDataViewModel(),
          ),
          ChangeNotifierProvider(create: (context) => ChangeLooksViewModel())
        ],
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
      home: const HomePage(),
    );
  }
}
