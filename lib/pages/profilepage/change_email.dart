import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/pages/profilepage/otp_page.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/provider/change_email_provider.dart';
import 'package:spinemotion_app/utils/routers.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

import '../registerpage/widgets/register_page_widgets.dart';

class ChangeEmailPage extends StatefulWidget {
  @override
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final _email = TextEditingController();

  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChangeEmailProvider(),
      child: Consumer<ChangeEmailProvider>(
        builder: (context, value, child) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
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
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  PageNavigator(ctx: context).nextPageOnly(page: ProfilePage());
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryElement,
              title: const Text(
                "Ubah Email",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Email baru"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("Masukkan alamat email yang baru", "email",
                      "email", _email),
                  SizedBox(
                    height: 5,
                  ),
                  reusableText("Password"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("Masukkan password untuk keamanan", "password",
                      "lock", _password),
                  SizedBox(
                    height: 5,
                  ),
                  buildRegisterButton(
                    context: context,
                    buttonName: "Ubah Email",
                    status: value.isLoading,
                    tap: () {
                      if (_email.text.isEmpty || _password.text.isEmpty) {
                        showMessage(
                          message: "Email tidak boleh kosong",
                          context: context,
                        );
                      } else {
                        value.requestChangeEmail(
                          email: _email.text,
                          password: _password.text,
                          context: context,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
