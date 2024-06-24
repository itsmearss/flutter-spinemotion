import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/pages/registerpage/widgets/register_page_widgets.dart';
import 'package:spinemotion_app/provider/change_password_provider.dart';
import 'package:spinemotion_app/utils/routers.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChangePasswordProvider(),
      child: Consumer<ChangePasswordProvider>(
        builder: (context, value, child) {
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
                "Ubah Password",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Password lama"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("Masukkan password lama", "password", "lock",
                      _oldPassword),
                  SizedBox(
                    height: 5,
                  ),
                  reusableText("Password baru"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("Masukkan password baru", "password", "lock",
                      _newPassword),
                  SizedBox(
                    height: 5,
                  ),
                  reusableText("Konfirmasi password baru"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("Masukkan konfirmasi password baru",
                      "password", "lock", _confirmPassword),
                  SizedBox(
                    height: 5,
                  ),
                  buildRegisterButton(
                    context: context,
                    buttonName: "Ubah password",
                    status: value.isLoading,
                    tap: () {
                      if (_confirmPassword.text.isEmpty ||
                          _newPassword.text.isEmpty ||
                          _oldPassword.text.isEmpty) {
                        showMessage(
                          message: "Semua field harus diisi",
                          context: context,
                        );
                      } else if (_newPassword.text != _confirmPassword.text) {
                        showMessage(
                          message: "Password baru tidak sama",
                          context: context,
                        );
                      } else {
                        value.requestChangePassword(
                          oldPassword: _oldPassword.text,
                          newPassword: _newPassword.text,
                          confirmPassword: _confirmPassword.text,
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
