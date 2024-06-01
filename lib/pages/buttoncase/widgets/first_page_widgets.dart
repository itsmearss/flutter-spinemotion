
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application_color.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Consumer<ApplicationColor>(
      builder: (context, applicationColor, _) =>
          Text(
        "Provider State Management",
        style: TextStyle(color: applicationColor.color),
      ),
    ),
  );
}

Widget buttonLamp() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<ApplicationColor>(
          builder: (context, applicationColor, _) => AnimatedContainer(
            width: 100,
            height: 100,
            color: applicationColor.color,
            duration: Duration(milliseconds: 500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(margin: EdgeInsets.all(5), child: Text("AB"),),
            Consumer<ApplicationColor>( builder: (context, applicationColor, _)=>
                Switch(value: applicationColor.isLightBlue, onChanged: (newValue) {
                  applicationColor.isLightBlue = newValue;
                },)),
            Container(margin: EdgeInsets.all(5), child: Text("LB"),)
          ],
        )
      ],
    ),
  );
}
