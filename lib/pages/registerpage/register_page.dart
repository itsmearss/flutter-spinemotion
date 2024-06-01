import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/registerpage/provider/terms.dart';
import 'package:spinemotion_app/pages/registerpage/widgets/register_page_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<TermsProvider>(
        create: (context) => TermsProvider(),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(context, "Register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Full Name"),
                          SizedBox(height: 5.h,),
                          buildTextField("Enter your full name", "email", "user"),
                          reusableText("Email"),
                          SizedBox(height: 5.h,),
                          buildTextField("Enter your email adress", "email", "email"),
                          reusableText("Phone Number"),
                          SizedBox(height: 5.h,),
                          buildTextField("Enter your phone number", "email", "phone"),
                          reusableText("Password"),
                          SizedBox(height: 5.h,),
                          buildTextField("Enter your password", "email", "lock"),
                          reusableText("Confirm Password"),
                          SizedBox(height: 5.h,),
                          buildTextField("Enter your password", "email", "lock" ),
                          syaratKetentuan(),
                          SizedBox(height: 25.h,)
                        ],
                      ),
                    ),
                    buildRegisterButton( "Register", "register")
                  ],
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }


}
