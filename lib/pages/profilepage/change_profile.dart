import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/pages/registerpage/widgets/register_page_widgets.dart';
import 'package:spinemotion_app/provider/change_profile_provider.dart';
import 'package:spinemotion_app/utils/routers.dart';
import 'package:spinemotion_app/utils/snack_message.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key, this.name, this.noHP}) : super(key: key);

  final String? name;
  final String? noHP;

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  final _name = TextEditingController();
  final _no_hp = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _name.text = widget.name!;
      _no_hp.text = widget.noHP!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChangeProfileProvider(),
      child: Consumer<ChangeProfileProvider>(
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
                    PageNavigator(ctx: context)
                        .nextPageOnly(page: ProfilePage());
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
                backgroundColor: AppColors.primaryElement,
                title: const Text(
                  "Ubah Profile",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Ubah Nama"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField(
                      "Masukkan nama lengkap", "email", "user", _name),
                  SizedBox(
                    height: 5,
                  ),
                  reusableText("Ubah No Handphone"),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("Masukkan nomor hp", "email", "phone", _no_hp),
                  SizedBox(
                    height: 5,
                  ),
                  buildRegisterButton(
                      context: context,
                      buttonName: "Simpan",
                      status: value.isLoading,
                      tap: () {
                        if (_name.text.isEmpty || _no_hp.text.isEmpty) {
                          showMessage(
                              message: "Data tidak boleh kosong",
                              context: context);
                        } else {
                          value.changeProfile(
                            name: _name.text,
                            noHP: _no_hp.text,
                            context: context,
                          );
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
