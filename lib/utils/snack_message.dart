import 'package:flutter/material.dart';
import 'package:spinemotion_app/common/values/colors.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: AppColors.primaryElementText),
      ),
      backgroundColor: AppColors.primaryElement));
}
