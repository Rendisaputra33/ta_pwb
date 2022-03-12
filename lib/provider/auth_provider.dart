import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;

  void setLoading(bool status) {
    loading = status;
    notifyListeners();
  }
}