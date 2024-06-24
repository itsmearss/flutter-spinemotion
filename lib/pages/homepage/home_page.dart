import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/homepage/theme_provider.dart';

import '../homepage/widgets/home_page_widgets.dart';
import '../homepage/widgets/calendar.dart';
import '../homepage/calendar_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            // appBar: buildAppBar(),
            body: Stack(
              children: [
                boxInfo(context),
                buttonTheme(context),
                boxStartTerapi(context),
                // Positioned(
                //   bottom: 165.h,
                //   left: 12.w,
                //   right: 12.w,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 16.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children:
                //         List.generate(
                //           7,
                //           (index) => ScheduleTerapi(day: "Mo", selectDate: _selectDateNotifier, onTap: (){
                //             _selectDateNotifier.value = !_selectDateNotifier.value;
                //           },),
                //         ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Positioned(
                    bottom: 23.h,
                    left: 12.w,
                    right: 12.w,
                    child: boxMenu(context, "W")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
