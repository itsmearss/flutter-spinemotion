import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isExercisePressed = false;
  Color _boxInfoColor = Color.fromRGBO(59, 120, 138, 1);
  Color _boxInfoExercise = Color.fromRGBO(59, 120, 138, 1);
  Color _boxInfoText = Colors.white;
  Color _boxInfoPrimary = Colors.white30;
  Color _boxInfoSleep = Colors.white30;
  double _sleepButtonLeft = 80;
  bool _isFirstImage = true;


  bool get isExercisePressed => _isExercisePressed;
  Color get boxInfoColor => _boxInfoColor;
  Color get boxInfoExercise => _boxInfoExercise;
  Color get boxInfoText => _boxInfoText;
  Color get boxInfoPrimary => _boxInfoPrimary;
  Color get boxInfoSleep => _boxInfoSleep;
  double get sleepButtonLeft => _sleepButtonLeft;
  bool get isFirstImage => _isFirstImage;

  void toggleExercisePressed() {
    _isExercisePressed = !_isExercisePressed;
    _boxInfoColor = _isExercisePressed ? Color.fromRGBO(153, 135, 115, 1) : Color.fromRGBO(59, 120, 138, 1);
    _boxInfoExercise = _isExercisePressed ? Colors.white70 : Color.fromRGBO(59, 120, 138, 1);
    _boxInfoText = _isExercisePressed ? Colors.black : Colors.white;
    _boxInfoPrimary = _isExercisePressed ? Colors.white38 : Colors.white30;
    _boxInfoSleep = _isExercisePressed ? Color.fromRGBO(153, 135, 115, 1) : Colors.white70;
    _sleepButtonLeft = _sleepButtonLeft == 60 ? 152 : 80;
    _isFirstImage = !_isFirstImage;
    notifyListeners();
  }

  String get currentImage => _isFirstImage
      ? 'assets/images/sp-menu.png'
      : 'assets/images/sp-menu2.png';

}