import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/loginpage/widgets/login_page_widgets.dart';
import 'package:spinemotion_app/provider/login_provider.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: Consumer<LoginProvider>(builder: (context, value, child) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
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
                  appBar: buildAppBar(context, "Masuk"),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildIllustration(context, "exercise"),
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
                              buildTextField(
                                  "Masukkan email", "email", "email", _email),
                              reusableText("Password"),
                              SizedBox(
                                height: 5.h,
                              ),
                              buildTextField("Masukkan password", "password",
                                  "lock", _password)
                            ],
                          ),
                        ),
                        forgotPassword(context),
                        buildLoginButton(
                          context: context,
                          buttonName: "Masuk",
                          status: value.isLoading,
                          tap: () {
                            if (_email.text.isEmpty || _password.text.isEmpty) {
                              showMessage(
                                  message: "Semua field harus diisi",
                                  context: context);
                            } else {
                              value.loginUser(
                                  email: _email.text.trim(),
                                  password: _password.text.trim(),
                                  context: context);
                            }
                          },
                        ),
                        // buildLoginButton(
                        //   context: context,
                        //   buttonName: "Login Google",
                        //   status: value.isLoading,
                        //   tap: () {
                        //     value.googleLogin();
                        //   },
                        // ),
                        // buildLogInAndRegisterButton("Register", "register")
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
