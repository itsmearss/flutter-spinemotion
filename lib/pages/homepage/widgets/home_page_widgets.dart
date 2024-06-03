import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/homepage/theme_provider.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/pages/terapipage/terapi_page.dart';

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

Widget titleMenu() {
  return Container(
    margin: EdgeInsets.only(top: 260.h, left: 10.w),
    child: Text(
      "Pilih Gerakan",
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget pilihGerakan({required Widget child}) {
  return Positioned(
    top: 20.h,
    bottom: 100.h,
    left: 10,
    right: 0,
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 100.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white60, width: 2),
            color: Colors.blue,
          ),
          child: Center(child: child),
        ),
      ),
    ),
  );
}

Widget menuOption(BuildContext context) {
  return Center(
    child: Stack(children: [
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/yogamenu.png"),
                        fit: BoxFit.cover,
                      ),
                      // color: Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // color: Colors.blue,
                      child: Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TerapiPage()));
                          },
                          child: Text('Mulai !'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey[600],
                            padding: EdgeInsets.symmetric(
                                vertical: 48, horizontal: 40),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

Widget articleList(
    {required String title,
    required imageUrl,
    required String duration,
    required String calories}) {
  return Container(
    width: 300,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 135.h,
        decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'warming up',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 3.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(width: 8),
                    Text(duration),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_fire_department),
                    SizedBox(width: 8),
                    Text(calories),
                  ],
                ),
              ],
            ),
          ],
        ),
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
          top: 260.h,
          left: 50.w,
          child: Consumer(
            builder: (context, ThemeProvider img, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 195,
                  width: 230,
                  child: Image.asset(
                    img.currentImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Consumer<ThemeProvider>(
                  builder: (context, term, _) => Container(
                    margin: EdgeInsets.only(left: 33.w),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TerapiPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: term.boxInfoColor.withOpacity(0.8),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                      child: Text(
                        "Pilih Gerakanmu",
                        style:
                            TextStyle(color: Color.fromRGBO(238, 232, 213, 1)),
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: Container(
                //     margin: EdgeInsets.only(top: 10.h),
                //     width: 300,
                //     height: 150,
                //     decoration: BoxDecoration(
                //       color: Colors.orange[200],
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(16.0),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(
                //             'Temukan Informasi Kesehatan',
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           SizedBox(height: 16),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               ElevatedButton(
                //                 onPressed: () {},
                //                 style: ElevatedButton.styleFrom(
                //                   primary: Colors.white,
                //                   onPrimary: Colors.orange[200],
                //                   padding: EdgeInsets.symmetric(
                //                     horizontal: 24,
                //                     vertical: 12,
                //                   ),
                //                   textStyle: TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 child: Row(
                //                   children: [
                //                     Icon(Icons.play_arrow),
                //                     SizedBox(width: 8),
                //                     Text('Get Started'),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textRecent() {
  return Container(
    margin: EdgeInsets.only(top: 515.h, left: 20.w),
    child: Text("Recent Workouts",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
          shadows: [
            Shadow(
              offset: Offset(1, 1), // Shadow tidak bergeser
              color: Colors.black,
              blurRadius: 5, // Menambahkan blur untuk membuat efek lebih halus
            ),
          ],
        )),
  );
}

Widget recentWorkouts({
  required title,
  required duration,
  required calories,
  required imagePath,
  required onPressed,
}) {
  return GestureDetector(
    onTap: () => onPressed(),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 10,
              ),
              Text(
                duration,
                style: TextStyle(fontSize: 11),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.local_fire_department,
                size: 10,
              ),
              Text(
                calories,
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
          Image.asset(
            imagePath,
            height: 60,
            width: 60.w,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    ),
  );
}
