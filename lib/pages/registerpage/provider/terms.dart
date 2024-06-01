import 'package:flutter/material.dart';

class TermsProvider extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;
  set term(bool? value) {
    _isChecked = value!;
    notifyListeners();
  }
}
