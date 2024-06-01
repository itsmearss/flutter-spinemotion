// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:spinemotion_app/screens/sign_in/widgets/sign_in_button.dart';
// import 'package:spinemotion_app/screens/sign_in/widgets/sign_in_widgets.dart';
// import 'package:spinemotion_app/screens/sign_in/widgets/text_field.dart';
//
// import '../../controllers/login_controller.dart';
//
//
// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   // RegistrationController registrationController =
//   // Get.put(RegistrationController());
//
//   final LoginController loginController = Get.put(LoginController());
//
//   // var isLogin = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: buildAppBar(),
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 buildIllustration(context, "exercise"),
//                 Container(
//
//                   margin: EdgeInsets.only(top: 36.h),
//                   padding: EdgeInsets.only(left: 25.w, right: 25.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InputTextFieldWidget(loginController.emailController, "Enter your email address"),
//                       SizedBox(height: 5.h,),
//                       InputTextFieldWidget(loginController.passwordController, "Enter your password")
//                     ],
//                   ),
//                 ),
//                 forgotPassword(),
//                 LoginButton(
//                   onPressed: () => loginController.loginWithEmail(),
//                   title: 'Register',
//                 ),
//                 // buildLogInAndRegisterButton("Register", "register")
//               ],
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
//
//
// }