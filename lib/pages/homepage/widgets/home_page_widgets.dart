import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/articlepage/article.dart';
import 'package:spinemotion_app/pages/homepage/widgets/schedule.dart';
import 'package:spinemotion_app/pages/profilepage/profile_page.dart';
import 'package:spinemotion_app/utils/routers.dart';

import '../../articlepage/article_provider.dart';

Widget boxInfo(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Container(
      color: Color.fromRGBO(59, 120, 138, 1),
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
                    top: 15.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 40.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          PageNavigator(ctx: context)
                              .nextPageOnly(page: ProfilePage());
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white70,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/profile.jpg"))),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 80,
                    left: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        "Hallo Ryujin, Selamat Datang !",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white70,
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
                color: Color.fromRGBO(235, 236, 237, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            height: height * 0.75,
            width: width,
          ),
        ],
      ),
    ),
  );
}

Widget buttonTheme(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 85.h, left: 120.w),
    child: Stack(
      children: [
        Positioned(
          top: 100.h,
          left: 10.w,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(59, 120, 138, 1),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
            ),
            child: Text(
              'Exercise',
              style: TextStyle(color: Colors.grey[200]),
            ),
          ),
        ),
        Positioned(
          top: 100.h,
          left: 50.w,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlaceTypeView()));
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

// Widget scheduleTerapi(String day) {
//   // bool _selectDate = true;
//   String day;
//   return InkWell(
//     onTap: onTap,
//     child: ValueListenableBuilder<bool>(
//       valueListenable: _selectDate,
//       builder: (context, value, child) {
//         return Container(
//           width: 40.w,
//           height: 40.h,
//           decoration: value
//               ? null
//               : BoxDecoration(
//             color: Colors.white38,
//             borderRadius: BorderRadius.all(Radius.circular(18.w)),
//             border: Border.all(color: Colors.purple),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: Text(
//                   day,
//                   style: TextStyle(
//                     color: value ? Colors.white : Colors.purple,
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//               Text(
//                 "10",
//                 style: TextStyle(
//                   color: value ? Colors.white : Colors.purple,
//                   fontSize: 30,
//                 ),
//               ),
//               Container(
//                 width: 4.0,
//                 height: 4.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: value ? Colors.red : Colors.purple,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

Widget titleMenu() {
  return Container(
      padding: EdgeInsets.only(left: 20.w),
      child: Center(
        child: Text(
          "Menu Lainnya",
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(59, 120, 138, 1),
            decoration: TextDecoration.underline,
          ),
        ),
      ));
}

Widget boxMenu(BuildContext context, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ChangeNotifierProvider(
          //         create: (context) => PageIndexNotifier(),
          //         child: PerformPage(),),
          //     ));
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
      ),
      SizedBox(
        width: 5.w,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => PageIndexNotifier(),
                  child: ArticlePage(),
                ),
              ));
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

Widget bottomNavbar() {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera_alt),
        label: 'Camera',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notification',
      ),
    ],
  );
}
