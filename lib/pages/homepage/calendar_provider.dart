import 'package:flutter/material.dart';

class CalendarProvider with ChangeNotifier {
  ValueNotifier<bool> _selectDate = ValueNotifier<bool>(false);

  ValueNotifier<bool> get selectDate => _selectDate;

  void toggleSelectDate() {
    _selectDate.value = !_selectDate.value;
    notifyListeners();
  }
}
