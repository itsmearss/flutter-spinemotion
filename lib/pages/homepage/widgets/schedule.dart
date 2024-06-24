import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  void navigateTo(BuildContext context, String day) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DayScreen(day: day)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Exercises'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Monday'),
                child: Text('M'),
              ),
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Tuesday'),
                child: Text('T'),
              ),
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Wednesday'),
                child: Text('W'),
              ),
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Thursday'),
                child: Text('T'),
              ),
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Friday'),
                child: Text('F'),
              ),
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Saturday'),
                child: Text('S'),
              ),
              ElevatedButton(
                onPressed: () => navigateTo(context, 'Sunday'),
                child: Text('S'),
              ),
            ],
          ),
          // Add other widgets here
        ],
      ),
    );
  }
}

class DayScreen extends StatelessWidget {
  final String day;

  DayScreen({required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$day Exercises'),
      ),
      body: Center(
        child: Text('Exercises for $day'),
      ),
    );
  }
}
