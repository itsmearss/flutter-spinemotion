import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/loginpage/widgets/login_page_widgets.dart';
import 'package:spinemotion_app/provider/forgot_password_provider.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();

    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordProvider(),
      child: Consumer<ForgotPasswordProvider>(
        builder: (context, value, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (value.resMessage != "") {
              showMessage(
                message: value.resMessage,
                context: context,
              );

              value.clear();
            }
          });
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Forgot Password"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField("Enter your email adress", "email",
                            "email", _email),
                      ],
                    ),
                  ),
                  buildLoginButton(
                    context: context,
                    buttonName: "Konfirmasi",
                    status: value.isLoading,
                    tap: () {
                      if (_email.text.isEmpty) {
                        showMessage(
                            message: "All fields are required",
                            context: context);
                      } else {
                        value.forgotPassword(
                            email: _email.text.trim(), context: context);
                      }
                    },
                  ),
                  // buildLogInAndRegisterButton("Register", "register")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
