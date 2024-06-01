// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SignInController extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   void loginWithEmail() {
//     final email = emailController.text;
//     final password = passwordController.text;
//
//     if (email.isEmpty || password.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Email and password cannot be empty',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     try {
//       // Simulate login process
//       if (email == "test@example.com" && password == "password") {
//         Get.snackbar(
//           'Success',
//           'Logged in successfully',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         Get.snackbar(
//           'Error',
//           'Invalid email or password',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Something went wrong',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
// }
