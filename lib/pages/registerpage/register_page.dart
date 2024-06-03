import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/registerpage/provider/terms.dart';
import 'package:spinemotion_app/pages/registerpage/widgets/register_page_widgets.dart';
import 'package:spinemotion_app/provider/register_provider.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _noHp = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _fullname.dispose();
    _email.dispose();
    _noHp.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterProvider(),
        child: Consumer<RegisterProvider>(builder: (context, value, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (value.resMessage != "") {
              showMessage(
                message: value.resMessage,
                context: context,
              );

              value.clear();
            }
          });
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(context, "Register"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Full Name"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Enter your full name", "email",
                                "user", _fullname),
                            reusableText("Email"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Enter your email adress", "email",
                                "email", _email),
                            reusableText("Phone Number"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Enter your phone number", "email",
                                "phone", _noHp),
                            reusableText("Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Enter your password", "email",
                                "lock", _password),
                            reusableText("Confirm Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Enter your password", "email",
                                "lock", _confirmPassword),
                            syaratKetentuan(),
                            SizedBox(
                              height: 25.h,
                            )
                          ],
                        ),
                      ),
                      buildRegisterButton(
                          context: context,
                          status: value.isLoading,
                          buttonName: "Register",
                          tap: () {
                            if (_fullname.text.isEmpty ||
                                _email.text.isEmpty ||
                                _noHp.text.isEmpty ||
                                _password.text.isEmpty ||
                                _confirmPassword.text.isEmpty) {
                              showMessage(
                                  message: "All fields are required",
                                  context: context);
                            } else {
                              value.registerUser(
                                  fullname: _fullname.text.trim(),
                                  email: _email.text.trim(),
                                  noHp: _noHp.text.trim(),
                                  password: _password.text.trim(),
                                  confirmPassword: _confirmPassword.text.trim(),
                                  context: context);
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
