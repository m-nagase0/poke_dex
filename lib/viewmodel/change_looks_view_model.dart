import 'package:flutter/material.dart';

class ChangeLooksViewModel extends ChangeNotifier {
  int imageNumber = 0;

  Future<void>changePokeImage({required index}) async {
    imageNumber = index;
    notifyListeners();
  }
}