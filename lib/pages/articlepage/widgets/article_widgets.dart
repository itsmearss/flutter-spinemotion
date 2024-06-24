import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/articlepage/article_list.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ),
    ),
    backgroundColor: Color.fromRGBO(216, 228, 232, 1),
    centerTitle: true,
    title: Text(
      "Artikel Kesehatan",
      style: TextStyle(color: Colors.black, fontSize: 15.sp),
    ),
  );
}

Widget listWidget(ListItem item) {
  return Card(
    elevation: 2.0,
    margin: EdgeInsets.only(bottom: 20.h),
    color: Color.fromRGBO(216, 228, 232, 1),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Hero(
            tag: '${item.newsTitle}',
            child: Container(
              width: 90.w,
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.blueAccent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  item.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.newsTitle,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                item.desc,
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    item.date,
                    style: TextStyle(fontSize: 10.sp),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    ),
  );
}
