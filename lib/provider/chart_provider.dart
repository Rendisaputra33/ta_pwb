import 'package:flutter/material.dart';

class ChartProvider extends ChangeNotifier {
  int valueChart = 0;

  void changeValueChart(int newValue) {
    valueChart = newValue;
    notifyListeners();
  }
}
