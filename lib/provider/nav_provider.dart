import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  int _index = 0;

  void setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  int get index => _index;
}
