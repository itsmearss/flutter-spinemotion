import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/profilepage/change_email.dart';
import 'package:spinemotion_app/pages/registerpage/widgets/register_page_widgets.dart';
import 'package:spinemotion_app/provider/change_email_provider.dart';
import 'package:spinemotion_app/utils/routers.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

class otpPage extends StatefulWidget {
  const otpPage({super.key});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  final _otp = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _otp.dispose();
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
              backgroundColor: AppColors.primaryElement,
              title: const Text(
                "Verifikasi OTP",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              leading: IconButton(
                onPressed: () {
                  PageNavigator(ctx: context)
                      .nextPageOnly(page: ChangeEmailPage());
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("OTP (One-Time Password)"),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Masukkan Kode OTP", "email", "phone", _otp),
                  SizedBox(
                    height: 5,
                  ),
                  buildRegisterButton(
                    context: context,
                    buttonName: "Verifikasi OTP",
                    tap: () {
                      if (_otp.text.isEmpty) {
                        showMessage(
                          message: "Kode OTP tidak boleh kosong",
                          context: context,
                        );
                      } else {
                        value.changeEmail(
                          otp: _otp.text,
                          context: context,
                        );
                      }
                    },
                    status: value.isLoading,
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
