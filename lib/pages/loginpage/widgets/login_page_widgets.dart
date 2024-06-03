import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/pages/forgotpassword/forgot_password.dart';
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/utils/routers.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(String? name) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height define the thickness of the line
        height: 1.0,
      ),
    ),
    title: Text(
      name!,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildIllustration(BuildContext context, String image) {
  return Container(
    width: 1000.w,
    height: 200.h,
    margin: EdgeInsets.only(bottom: 10.h, top: 20.h),
    alignment: Alignment.center,
    child: Image.asset(
      "assets/images/$image.png",
      width: 200.w,
      height: 200.h,
      fit: BoxFit.cover,
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 3.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    TextEditingController text) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourthElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(59, 120, 138, 1),
                BlendMode.srcIn,
              ),
              child: Image.asset("assets/icons/$iconName.png")),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            controller: text,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle:
                  TextStyle(color: AppColors.primarySecondaryElementText),
            ),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword(BuildContext? context) {
  return Container(
    margin: EdgeInsets.only(left: 240.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {
        PageNavigator(ctx: context).nextPageOnly(page: ForgotPasswordPage());
      },
      child: Text(
        "Forgot Password",
        style: TextStyle(
            color: AppColors.primaryElement,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryElement,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLoginButton(
    {BuildContext? context,
    String? buttonName,
    bool? status = false,
    VoidCallback? tap}) {
  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 20.h),
      decoration: BoxDecoration(
          color: status == false
              ? AppColors.primaryElement
              : AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          status == false ? buttonName! : 'Please wait...',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryBackground),
        ),
      ),
    ),
  );
}
