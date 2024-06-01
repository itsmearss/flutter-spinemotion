import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      color: Colors.blueGrey,
      margin: EdgeInsets.only(left: 5.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(children: [
              ]),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget pilihGerakan({required Widget child, required double width, required double height}) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.h),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.blueGrey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Colors.transparent,
    ),
    child: Center(child: child),
  );
}

