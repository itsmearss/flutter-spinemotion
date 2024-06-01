import 'package:flutter/material.dart';
import 'detect_page.dart';


class MainPageCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetectPage(selectedPose: 'Bridge-Pose'),
                      ),
                    );
                  },
                  child: Text('Bridge-Pose'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetectPage(selectedPose: 'Chest-Opener-Stretch'),
                      ),
                    );
                  },
                  child: Text('Chest-Opener-Stretch'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetectPage(selectedPose: 'Cobra-Pose'),
                      ),
                    );
                  },
                  child: Text('Cobra-Pose'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetectPage(selectedPose: 'Seated-Wall-Angels'),
                      ),
                    );
                  },
                  child: Text('Seated-Wall-Angels'),
                ),
              ],
            ),
        ),
        );
    }
}