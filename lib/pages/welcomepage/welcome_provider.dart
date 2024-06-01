import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  int _page = 0;

  int get page => _page;
  set page(int newPage) {
    _page = newPage;
    notifyListeners();
  }
}
