import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/frontpage/front_page.dart';
import 'package:spinemotion_app/pages/welcomepage/welcome_provider.dart';

import '../../common/values/colors.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => WelcomeProvider(),
            child: Scaffold(
              body: Consumer<WelcomeProvider>(
                builder: (context, provider, _) {
                  return Container(
                    margin: EdgeInsets.only(top: 34.h),
                    width: 375.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        PageView(
                          controller: pageController,
                          onPageChanged: (newPage) {
                            provider.page = newPage;
                          },
                          children: [
                            _page(
                              0,
                              context,
                              "next",
                              "Pantau Kesehatan Tulangmu",
                              "Kurangi pola hidup yang tidak sehat dan fokus perbaiki",
                              "assets/images/gow.png",
                            ),
                            _page(
                              1,
                              context,
                              "next",
                              "Melakukan Gerakan Terapi",
                              "Dilakukan mandiri dengan aplikasi yang akan memudahkanmu",
                              "assets/images/yoga.png",
                            ),
                            _page(
                              2,
                              context,
                              "get started",
                              "Technology for Better Life",
                              "Bergabung dengan spinemotion untuk memulai perjalanan sehatmu",
                              "assets/images/org.png",
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 100.h,
                          child: DotsIndicator(
                            position: provider.page,
                            dotsCount: 3,
                            mainAxisAlignment: MainAxisAlignment.center,
                            decorator: DotsDecorator(
                              color: AppColors.primaryThirdElementText,
                              activeColor: AppColors.primaryElement,
                              size: const Size.square(8.0),
                              activeSize: const Size(18.0, 8.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title, String subTitle, String imagePath) {
    return Column(
        children: [
          SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Text(
              subTitle,
              style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (index < 2) {
                pageController.animateToPage(
                  index + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                // Navigator.of(context).pushNamedAndRemoveUntil("frontPage", (route) => false);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FrontPage()));
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
              width: 325.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
    );
  }
}
