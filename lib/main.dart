import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/frontpage/front_page.dart';
import 'package:spinemotion_app/pages/loginpage/login_page.dart';
import 'package:spinemotion_app/provider/change_email_provider.dart';
import 'package:spinemotion_app/provider/change_password_provider.dart';
import 'package:spinemotion_app/provider/change_profile_provider.dart';
import 'package:spinemotion_app/provider/login_provider.dart';
import 'package:spinemotion_app/provider/profile_provider.dart';
import 'package:spinemotion_app/provider/register_provider.dart';
import 'package:spinemotion_app/splash.dart';

import 'pages/articlepage/article_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => RegisterProvider()),
          ChangeNotifierProvider(create: (_) => ChangeEmailProvider()),
          ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
          ChangeNotifierProvider(create: (_) => ChangeProfileProvider()),
          ChangeNotifierProvider(create: (_) => PageIndexNotifier())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: {
            "frontPage": (context) => const FrontPage(),
            "signIn": (context) => const LoginPage(),
          },
        ),
      ),
    );
  }
}
