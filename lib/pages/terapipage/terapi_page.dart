import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/pages/terapipage/terapi_model.dart';
import 'package:spinemotion_app/pages/terapipage/widgets/terapi_page_widgets.dart';

import '../homepage/widgets/calendar.dart';

class TerapiPage extends StatelessWidget {
  final ValueNotifier<bool> _selectDateNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(201, 218, 223, 1),
      appBar: buildAppBar(),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) => ScheduleTerapi(
                    day: "Mo",
                    selectDate: _selectDateNotifier,
                    onTap: () {
                      _selectDateNotifier.value = !_selectDateNotifier.value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h), // Spacer for visual separation
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildGerakanItem(
                    context,
                    title: 'BRIDGE POSE',
                    description:
                        'Bridge Pose dapat memperkuat otot-otot punggung dan gluteus, meningkatkan fleksibilitas tulang belakang.',
                    imagePath: 'assets/images/bridge_pose.png',
                    targetPage: BridgePosePage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'CHEST OPENER STRETCH',
                    description:
                        'Chest opener stretch membantu meningkatkan fleksibilitas, mengurangi ketegangan, serta mengoreksi postur bahu yang bungkuk.',
                    imagePath: 'assets/images/cobra_pose.png',
                    targetPage: ChestOpenerStretchPage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'COBRA POSE',
                    description:
                        'Gerakan Cobra Pose dapat memperkuat otot punggung bagian bawah, meningkatkan fleksibilitas tulang belakang.',
                    imagePath: 'assets/images/cobra_pose.png',
                    targetPage: CobraPosePage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'MOUNTAIN POSE',
                    description:
                        'Mountain Pose dapat meningkatkan keseimbangan dan postur tubuh.',
                    imagePath: 'assets/images/bridge_pose.png',
                    targetPage: MountainPosePage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'PUSH UP TO DOWN DOG',
                    description:
                        'Push up to Down Dog dapat meningkatkan kekuatan dan fleksibilitas tubuh bagian atas dan bawah.',
                    imagePath: 'assets/images/cobra_pose.png',
                    targetPage: PushUpToDownDogPage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'SEATED WALL ANGELS',
                    description:
                        'Seated Wall Angels membantu memperbaiki postur dan meningkatkan fleksibilitas bahu.',
                    imagePath: 'assets/images/bridge_pose.png',
                    targetPage: SeatedWallAngelsPage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'TABLE TOP LIFT',
                    description:
                        'Table Top Lift dapat memperkuat otot inti dan punggung.',
                    imagePath: 'assets/images/cobra_pose.png',
                    targetPage: TableTopLiftPage(),
                  ),
                  buildGerakanItem(
                    context,
                    title: 'WARRIOR POSE',
                    description:
                        'Warrior Pose dapat meningkatkan kekuatan dan daya tahan pada kaki serta meningkatkan keseimbangan.',
                    imagePath: 'assets/images/bridge_pose.png',
                    targetPage: WarriorPosePage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
