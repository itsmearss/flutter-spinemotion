import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/pages/loginpage/login_page.dart';
import 'package:spinemotion_app/pages/registerpage/register_page.dart';

import '../../../common/values/colors.dart';

Widget textFront(){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 200.h, right: 50.w),
        child: Text(
          "Healthy Bones, Brighter Future",
          style: TextStyle(
            color: AppColors.primaryThirdElementText,
            fontSize: 14.sp,
          ),
        ),
      ),
      Text(
        "SpineMotion",
        style: TextStyle(
          color: AppColors.primaryThirdElementText,
          fontSize: 25.sp,
        ),
      ),
    ],
  );
}

Widget buildTwoButton(BuildContext context, String buttonName, String buttonType){
  return GestureDetector(
    onTap: (){
      if (buttonType == "signUp") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RegisterPage()));
      } else if (buttonType == "signIn") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()));
      }


    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType=="login"?20.h:10.h),
      decoration: BoxDecoration(
          color: buttonType=="login"
              ?AppColors.primaryElement
              :AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: buttonType=="login"
                ?Colors.transparent
                :AppColors.primaryFourthElementText,
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1)
            )
          ]

      ),
      child: Center(child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: buttonType=="login"
              ?AppColors.primaryBackground
              :AppColors.primaryText,
        ),
      ),
      ),
    ),
  );
}