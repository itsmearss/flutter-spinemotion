import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/pages/frontpage/widgets/front_page_widgets.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgggw.png"), fit: BoxFit.cover),
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              margin: EdgeInsets.symmetric(vertical: 100.h, horizontal: 50.w),
              child: Column(children: [
                textFront(),
                SizedBox(
                  height: 50.h,
                ),
                buildTwoButton(context, "Create Your New Account", "signUp"),
                buildTwoButton(context, "Sign in to Your Account", "signIn")
              ])))
    ]);
  }
}
