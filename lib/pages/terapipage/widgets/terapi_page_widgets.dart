import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../terapi_page.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 5.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ),
  );
}

Widget buildGerakanItem(
  BuildContext context, {
  required String title,
  required String description,
  required String imagePath,
  required Widget targetPage,
}) {
  return Stack(
    children: [
      Container(
        width: 300.w,
        height: 100.h,
        margin: EdgeInsets.only(left: 20.w, top: 40.h, right: 50.w),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 20.h),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(235, 236, 237, 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 50.w, top: 25.h),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(0, 7),
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 170.w, right: 10.w, top: 40.h),
        child: Image.asset(
          imagePath,
          width: 300.w,
          height: 130.h,
        ),
      ),
      Container(
        width: 100.w,
        height: 30.h,
        margin: EdgeInsets.only(left: 35.w, top: 105.h),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(59, 120, 138, 0.6),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.r),
            ),
          ),
          child: Text(
            "Lihat",
            style: TextStyle(
              color: Color.fromRGBO(238, 232, 213, 1),
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget chooseTeraphy() {
  return ListView.builder(
    padding: EdgeInsets.symmetric(vertical: 0.h),
    itemCount: 8,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.only(
            top: 15.h, left: 20.w, right: 20.w), // Added margin for better view
        width: 280.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text('Item $index'),
        ),
      );
    },
  );
}
