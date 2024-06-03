import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/frontpage/front_page.dart';
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/pages/loginpage/login_page.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/pages/startgerakan/start_gerakan.dart';
import 'package:spinemotion_app/pages/terapipage/terapi_page.dart';
import 'package:spinemotion_app/pages/trytry.dart';
import 'package:spinemotion_app/pages/welcomepage/welcome.dart';
import 'package:spinemotion_app/provider/login_provider.dart';

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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        routes: {
          "frontPage": (context) => const FrontPage(),
          "signIn": (context) => const LoginPage(),
        },
      ),
    );
  }
}
