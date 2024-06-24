import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleTerapi extends StatelessWidget {
  final String day;
  final ValueNotifier<bool> selectDate;
  final VoidCallback onTap;

  ScheduleTerapi({
    required this.day,
    required this.selectDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ValueListenableBuilder<bool>(
        valueListenable: selectDate,
        builder: (context, value, child) {
          return Container(
            width: 40.w,
            height: 40.h,
            decoration: value
                ? null
                : BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(18.w)),
                    border: Border.all(color: Colors.white),
                  ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Mo",
                    style: TextStyle(
                      fontWeight: value ? FontWeight.bold : FontWeight.normal,
                      color: value
                          ? Colors.white
                          : Color.fromRGBO(153, 135, 115, 1),
                      fontSize: 25,
                    ),
                  ),
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: value ? FontWeight.bold : FontWeight.normal,
                    color:
                        value ? Colors.white : Color.fromRGBO(153, 135, 115, 1),
                    fontSize: 25,
                  ),
                ),
                Container(
                  width: 4.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        value ? Colors.black : Color.fromRGBO(153, 135, 115, 1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
