// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/pages/welcomepage/welcome.dart';
import 'package:spinemotion_app/provider/database_provider.dart';
import 'package:spinemotion_app/utils/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

  navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      DatabaseProvider().getToken().then((value) {
        if (value == '') {
          print(value);
          PageNavigator(ctx: context).nextPage(page: Welcome());
        } else {
          print(value);
          PageNavigator(ctx: context).nextPage(page: HomePage());
        }
      });
    });
  }
}
