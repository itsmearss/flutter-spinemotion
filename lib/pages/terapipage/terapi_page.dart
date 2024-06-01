import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/homepage/theme_provider.dart';

import '../homepage/widgets/home_page_widgets.dart';
import '../startgerakan/start_gerakan.dart';

class TerapiPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/bridge-pose.png',
      'assets/images/chest-open.png',
      'assets/images/cobra-pose.png',
      'assets/images/seated-wall.png',
      'assets/images/bridge-pose.png',
      'assets/images/chest-open.png',
      'assets/images/cobra-pose.png',
      'assets/images/chest-open.png',
      'assets/images/bridge-pose.png',
    ];
    final List<String> pose = [
      "Bridge Pose",
      "Chest Open",
      "Cobra Pose",
      "Seated Wall",
      "Cobra Pose",
      "Bridge Pose",
      "Chest Open",
      "Bridge Pose",

    ];

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) =>
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
              child: Scaffold(
                backgroundColor: Color.fromRGBO(165, 189, 195, 1),
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(59, 120, 138, 0.7),
                  title: Text('Terapi Gerakan'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                ),
                body: Stack(
                  children: [
                    Positioned(
                      top: 10.h,
                      left: 0,
                      right: 0,
                      bottom: 19.h,
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: recentWorkouts(
                                title: pose[index],
                                duration: "12 min",
                                calories: "12 cal",
                                imagePath: imagePaths[index],
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SeatedAngels()));

                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     margin: EdgeInsets.only(top: 450.h),
                    //     height: 250,
                    //     child: ListView(
                    //       scrollDirection: Axis.horizontal,
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       children: [
                    //         articleList(title: 'Yoga Isolated', imageUrl: 'https://o-cdn-cas.sirclocdn.com/parenting/images/yoga-ashtanga.width-800.format-webp.webp', duration: '13 min', calories: '312 cal'),
                    //         articleList(title: 'Inner Healing Therapy', imageUrl: 'https://o-cdn-cas.sirclocdn.com/parenting/images/yoga-ashtanga.width-800.format-webp.webp', duration: '15 min', calories: '290 cal'),
                    //         // Add more articles as needed
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
