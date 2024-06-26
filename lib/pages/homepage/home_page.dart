import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../articlepage/article_provider.dart';
import '../homepage/widgets/home_page_widgets.dart';
import 'calendar_provider.dart';

class HomePage extends StatelessWidget {
  final ValueNotifier<bool> _selectDateNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageIndexNotifier(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(icon: Icon(Icons.camera_alt_sharp), label: 'Gerakan'),
        //     BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profil'),
        //
        //   ],
        // ),
        body: Stack(
          children: [
            boxInfo(context),
            buttonTheme(context),
            boxStartTerapi(context),
            Positioned(bottom: 160.h, child: titleMenu()),
            SizedBox(
              height: 10.h,
            ),
            Positioned(
              bottom: 50.h,
              left: 12.w,
              right: 12.w,
              child: boxMenu(context, "W"),
            ),
          ],
        ),
      ),
    );
  }
}
