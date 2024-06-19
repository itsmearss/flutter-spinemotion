import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/profilepage/change_email.dart';
import 'package:spinemotion_app/pages/profilepage/change_profile.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/provider/profile_provider.dart';

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
          final imageProvider = (value.profile!.data!.photo != null)
              ? NetworkImage(value.profile!.data!.photo!)
              : AssetImage("assets/images/ryujink.jpg") as ImageProvider;
          // final data = value.profile!.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('${value.profile!.data!.fullname}'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    DatabaseProvider().logOut(context);
                  },
                  icon: const Icon(Icons.exit_to_app),
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
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 18),
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
                  Text(
                    'No HP',
                    style: TextStyle(fontSize: 18),
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
                          backgroundColor: Color.fromRGBO(165, 189, 195, 1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          'Change Email',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(165, 189, 195, 1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          'Change Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangeProfilePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(165, 189, 195, 1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          'Change Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
