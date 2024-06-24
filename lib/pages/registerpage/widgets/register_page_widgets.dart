import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/frontpage/front_page.dart';
import 'package:spinemotion_app/pages/registerpage/provider/terms.dart';
import 'package:spinemotion_app/pages/registerpage/widgets/syarat_ketentuan.dart';
import 'package:spinemotion_app/utils/routers.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColors.primaryElement,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        PageNavigator(ctx: context).nextPageOnly(page: FrontPage());
      },
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height define the thickness of the line
        height: 1.0,
      ),
    ),
    title: Text(
      title!,
      style: TextStyle(
          color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
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
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            ),
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autofocus: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget syaratKetentuan() {
  return Container(
      // margin: EdgeInsets.only(right: 200.w),
      // width: 200.w,
      height: 25.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 0.7, // skala checkbox
            child: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Setuju dengan Syarat dan Ketentuan",
              style: TextStyle(
                  color: Color.fromRGBO(59, 120, 138, 1),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(59, 120, 138, 1),
                  fontSize: 10.sp),
            ),
          ),
        ],
      ));
}

Widget textSandK() {
  return Container(
    margin: EdgeInsets.all(10.w),
    child: Text(
        'We operate the mobile application SpineMotion (the "App"), as well as any other related products and services that refer or link to these legal terms (the "Legal Terms") (collectively, the "Services"). You can contact us by email at spinemotion@gmail.com'
        'or by mail to'
        'These Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity ("you"), and concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all of these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.'
        'Supplemental terms and conditions or documents that may be posted on the Services from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Legal Terms at any time and for any reason. We will alert you about any changes by updating the "Last updated" date of these Legal Terms, and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Legal Terms to stay informed of updates. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Legal Terms by your continued use of the Services after the date such revised Legal Terms are posted.'),
  );
}

Widget buildRegisterButton(
    {BuildContext? context,
    VoidCallback? tap,
    bool? status = false,
    String? buttonName}) {
  return Container(
      child: GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
      decoration: BoxDecoration(
          color: status == false
              ? Color.fromRGBO(59, 120, 138, 1)
              : AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          status == false ? buttonName! : "Mohon tunggu...",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    ),
  ));
}
