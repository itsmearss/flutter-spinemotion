import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../terapipage/terapi_model.dart';
import '../../terapipage/widgets/terapi_page_widgets.dart';

class PlaceTypeView extends StatelessWidget {
  const PlaceTypeView({super.key});

  static const textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(201, 218, 223, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(201, 218, 223, 1),
            elevation: 0,
            title: const Text("Jadwal Harian"),
            bottom: const CustomTabBar(),
          ),
          body: TabBarView(children: [
            ListView(
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
              ],
            ),
            ListView(
              children: [
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
              ],
            ),
            ListView(
              children: [
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
            ListView(
              children: [
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
                  title: 'WARRIOR POSE',
                  description:
                      'Warrior Pose dapat meningkatkan kekuatan dan daya tahan pada kaki serta meningkatkan keseimbangan.',
                  imagePath: 'assets/images/bridge_pose.png',
                  targetPage: WarriorPosePage(),
                ),
              ],
            ),
            ListView(
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
                  title: 'SEATED WALL ANGELS',
                  description:
                      'Seated Wall Angels membantu memperbaiki postur dan meningkatkan fleksibilitas bahu.',
                  imagePath: 'assets/images/bridge_pose.png',
                  targetPage: SeatedWallAngelsPage(),
                ),
                buildGerakanItem(
                  context,
                  title: 'COBRA POSE',
                  description:
                      'Gerakan Cobra Pose dapat memperkuat otot punggung bagian bawah, meningkatkan fleksibilitas tulang belakang.',
                  imagePath: 'assets/images/cobra_pose.png',
                  targetPage: CobraPosePage(),
                ),
              ],
            ),
            ListView(
              children: [
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
              ],
            ),
            ListView(
              children: [
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
                  title: 'WARRIOR POSE',
                  description:
                      'Warrior Pose dapat meningkatkan kekuatan dan daya tahan pada kaki serta meningkatkan keseimbangan.',
                  imagePath: 'assets/images/bridge_pose.png',
                  targetPage: WarriorPosePage(),
                ),
                buildGerakanItem(
                  context,
                  title: 'BRIDGE POSE',
                  description:
                      'Bridge Pose dapat memperkuat otot-otot punggung dan gluteus, meningkatkan fleksibilitas tulang belakang.',
                  imagePath: 'assets/images/bridge_pose.png',
                  targetPage: BridgePosePage(),
                ),
              ],
            )
          ]),
        ));
  }
}

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      indicator: BoxDecoration(
        color: Colors.transparent, // No color for indicator
      ),
      labelPadding: EdgeInsets.symmetric(vertical: 12),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 15),
      tabs: [
        TabItem(text: 'Senin', isSelected: _selectedIndex == 0),
        TabItem(text: 'Selasa', isSelected: _selectedIndex == 1),
        TabItem(text: 'Rabu', isSelected: _selectedIndex == 2),
        TabItem(text: 'Kamis', isSelected: _selectedIndex == 3),
        TabItem(text: 'Jumat', isSelected: _selectedIndex == 4),
        TabItem(text: 'Sabtu', isSelected: _selectedIndex == 5),
        TabItem(text: 'Minggu', isSelected: _selectedIndex == 6),
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabItem({Key? key, required this.text, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color.fromRGBO(201, 218, 223, 1) : Colors.white70,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4.0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Color.fromRGBO(59, 120, 138, 1),
          ),
        ),
      ),
    );
  }
}
