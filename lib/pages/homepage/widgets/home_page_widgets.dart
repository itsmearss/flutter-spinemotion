import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/homepage/theme_provider.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/pages/terapipage/terapi_page.dart';
import 'package:spinemotion_app/pages/articlepage/article.dart';

Widget boxInfo(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Consumer<ThemeProvider>(
      builder: (context, term, _) => Container(
        color: term.boxInfoColor,
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.25,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: term.boxInfoPrimary,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/ryujink.jpg"))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 30,
                            color: term.boxInfoText,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "Hallo Ryujin, Selamat Datang !",
                          style: TextStyle(
                            fontSize: 16,
                            color: term.boxInfoText.withOpacity(0.5),
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: term.boxInfoPrimary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: height * 0.75,
              width: width,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buttonTheme(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 94, right: 110, left: 120),
    child: Consumer<ThemeProvider>(
      builder: (context, term, _) => Stack(
        children: [
          Positioned(
            top: 100,
            left: 10,
            child: ElevatedButton(
              onPressed: () {
                term.toggleExercisePressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: term.boxInfoExercise,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              child: Text(
                'Exercise',
                style: TextStyle(color: Colors.grey[200]),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: term.sleepButtonLeft,
            child: ElevatedButton(
              onPressed: () {
                term.toggleExercisePressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: term.boxInfoSleep,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              child: Text(
                'Sleep',
                style: TextStyle(
                  color: Colors.grey[350],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget boxStartTerapi(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: Stack(
      children: [
        Positioned(
          top: 220.h,
          left: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ScreenUtil()
                    .setWidth(250), // adjust the width to your needs
                height: ScreenUtil()
                    .setHeight(220), // adjust the height to your needs
                child: Image.asset(
                  'assets/images/sp-menu.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 130.w,
                height: 30.h,
                margin: EdgeInsets.only(left: 60.w),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TerapiPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(159, 156, 152, 1),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  child: Text(
                    "Pilih Gerakanmu",
                    style: TextStyle(
                        color: Color.fromRGBO(238, 232, 213, 1),
                        fontSize: 13.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget boxMenu(BuildContext context, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 160.w,
        height: 120.h,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    "assets/images/visualize.png",
                    width: 230,
                    height: 220,
                  )),
              Transform.translate(
                  offset: Offset(0, -30),
                  child: Text(
                    "VISUALISASI",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
              // Text("Visualisasi")
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(59, 120, 138, 0.7),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      SizedBox(
        width: 5.w,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticlePage()),
          );
        },
        child: Container(
          width: 160.w,
          height: 120.h,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      "assets/images/article.png",
                      width: 230,
                      height: 220,
                    )),
                Transform.translate(
                    offset: Offset(0, -30),
                    child: Text(
                      "INFORMASI KESEHATAN",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))
                // Text("Visualisasi")
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(59, 120, 138, 0.7),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
    ],
  );
}
