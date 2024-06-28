import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/pages/profilepage/change_email.dart';
import 'package:spinemotion_app/pages/profilepage/change_password.dart';
import 'package:spinemotion_app/pages/profilepage/change_profile.dart';
import 'package:spinemotion_app/pages/profilepage/perform_page.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/provider/profile_provider.dart';
import 'package:spinemotion_app/utils/routers.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: Consumer<ProfileProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBackground,
            ),
          );
        } else {
          print(value.profile!.data!);
          final imageProvider = (value.profile!.data!.photo != null)
              ? NetworkImage(value.profile!.data!.photo!)
              : AssetImage("assets/images/ryujink.jpg") as ImageProvider;
          // final data = value.profile!.data!;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: AppColors.primaryElement,
              title: Text(
                '${value.profile!.data!.fullname}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  PageNavigator(ctx: context).nextPageOnly(page: HomePage());
// Kembali ke halaman sebelumnya
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    DatabaseProvider().logOut(context);
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${value.profile!.data!.fullname}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined,
                          size: 24, color: AppColors.primaryElement),
                      SizedBox(width: 5),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryElement,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${value.profile!.data!.email}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_iphone_outlined,
                          size: 24, color: AppColors.primaryElement),
                      SizedBox(width: 5),
                      Text(
                        'Nomor Handphone',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryElement,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${value.profile!.data!.noHp}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangeEmailPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Ubah nilai 12 sesuai kebutuhan
                          ),
                          backgroundColor: AppColors.primaryElement,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          'Ubah Email',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangePasswordPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Ubah nilai 12 sesuai kebutuhan
                          ),
                          backgroundColor: AppColors.primaryElement,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          'Ubah Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangeProfile(
                                    name: value.profile!.data!.fullname,
                                    noHP: value.profile!.data!.noHp,
                                  )));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Ubah nilai 12 sesuai kebutuhan
                          ),
                          backgroundColor: AppColors.primaryElement,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          'Ubah Profil',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
