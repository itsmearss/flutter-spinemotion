import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/common/values/colors.dart';
import 'package:spinemotion_app/pages/homepage/widgets/schedule.dart';
import 'package:spinemotion_app/pages/terapipage/widgets/camera_instruction.dart';
import 'package:spinemotion_app/utils/routers.dart';
import 'package:video_player/video_player.dart';

class ChestOpenerStretchPage extends StatefulWidget {
  const ChestOpenerStretchPage({super.key});

  @override
  State<ChestOpenerStretchPage> createState() => _ChestOpenerStretchPageState();
}

class _ChestOpenerStretchPageState extends State<ChestOpenerStretchPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/ChestOpenerStretch.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryElement,
        appBar: AppBar(
          backgroundColor: AppColors.primaryElement,
          leading: IconButton(
            onPressed: () {
              PageNavigator(ctx: context).nextPageOnly(page: PlaceTypeView());
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: Text(
            'Chest Opener Stretch',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(201, 218, 223, 1),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 13.w, right: 13.w, top: 20.h),
                  // judul dan kalori
                  child: Row(
                    children: [
                      Text(
                        "# 2 Chest Opener Stretch",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Text(
                        "2000 Kcal",
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 70,
                  thickness: 13,
                  color: Colors.white,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  width: 500.w,
                  height: 570.h,
                  margin: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Min',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 100.w,
                        height: 10.h,
                        margin: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(0.5),
                        ),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h, left: 12.w),
                        decoration: BoxDecoration(),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 15,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '134',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: _controller.value.isInitialized
                            ? Container(
                                padding: EdgeInsets.only(
                                    right: 20, top: 20, bottom: 20),
                                child: AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                ),
                              )
                            : Container(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Posisi Awal:",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8), // spasi antara judul dan konten
                          Text(
                            "1. Duduk tegak di lantai dengan punggung menyentuh dinding.",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            "2. Pastikan kepala, bahu, punggung, dan pinggul bersentuhan dengan dinding.",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Gerakan:",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8), // spasi antara judul dan konten
                          Text(
                            "1. Letakkan tangan di samping tubuh dengan telapak tangan menghadap ke depan, lengan lurus dan menyentuh dinding.",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            "2. Dorong lengan secara perlahan-lahan ke atas kepala, menjaga lengan tetap menyentuh dinding sebanyak mungkin.",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            "3. Luruskan lengan ke atas kepala semaksimal mungkin tanpa merenggangkan punggung dari dinding.",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InstructionCamera(
                                      pose: "Chest-Opener-Stretch",
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Mengatur sudut tombol
                                ),
                                backgroundColor: AppColors.primaryElement,
                                textStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                'START PRACTICE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
