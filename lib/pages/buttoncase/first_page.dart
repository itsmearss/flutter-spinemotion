import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/buttoncase/widgets/first_page_widgets.dart';

import 'application_color.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: buildAppBar(),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [buttonLamp()],
            ),
          ),
        ),
      ),
    );
  }
}
