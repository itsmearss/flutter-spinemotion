import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
  String _gender = 'Laki-laki';

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
                appBar: buildAppBar(context, "Buat Akun"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Nama Lengkap"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Masukkan nama lengkap", "email",
                                "user", _fullname),
                            reusableText("Email"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Masukkan email", "email", "email", _email),
                            reusableText("Nomor Handphone"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Masukkan nomor hp", "email", "phone", _noHp),
                            reusableText("Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Masukkan password", "password",
                                "lock", _password),
                            reusableText("Konfirmasi Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField("Masukkan konfirmasi password",
                                "password", "lock", _confirmPassword),
                            reusableText("Jenis Kelamin"),
                            SizedBox(height: 5.h),
                            Column(
                              children: value.genders.map((String gender) {
                                return RadioListTile<String>(
                                  title: Text(gender),
                                  value: gender,
                                  groupValue: _gender,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _gender = newValue!;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      buildRegisterButton(
                          context: context,
                          status: value.isLoading,
                          buttonName: "Buat Akun",
                          tap: () {
                            if (_fullname.text.isEmpty ||
                                _email.text.isEmpty ||
                                _noHp.text.isEmpty ||
                                _password.text.isEmpty ||
                                _confirmPassword.text.isEmpty) {
                              showMessage(
                                  message: "Semua field harus terisi",
                                  context: context);
                            } else {
                              value.registerUser(
                                  fullname: _fullname.text.trim(),
                                  email: _email.text.trim(),
                                  noHp: _noHp.text.trim(),
                                  password: _password.text.trim(),
                                  confirmPassword: _confirmPassword.text.trim(),
                                  gender: _gender,
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
