import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/common/values/colors.dart';

import '../../detectionpage/detect_page.dart';

class InstructionCamera extends StatelessWidget {
  final String pose;
  const InstructionCamera({super.key, required this.pose});

  @override
  Widget build(BuildContext context) {
    // Start a delayed function to navigate to the home page after 5 seconds
    // Future.delayed(Duration(seconds: 5), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => DetectPage(selectedPose: pose),
    //     ),
    //   );
    // });

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryElement,
        title: Text(
          'Instruksi Penggunaan Kamera',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(59, 120, 138, 0.1),
        padding: EdgeInsets.all(20),
        // margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  child: Image.asset('assets/images/landscape.png'),
                ),
                Container(
                  width: 200.w,
                  height: 120.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Posisikan Perangkat dengan Benar',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pastikan perangkat Anda diletakkan pada permukaan yang stabil. Letakkan kamera secara horizontal di depan Anda. Bersihkan kamera agar layar tidak buram.',
                        style: TextStyle(fontSize: 10.sp),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  child: Image.asset('assets/images/cahaya.png'),
                ),
                Container(
                  width: 200.w,
                  height: 120.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Pencahayaan yang Cukup',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pastikan area yang dipantau memiliki pencahayaan yang cukup. Hindari pencahayaan yang terlalu terang atau terlalu gelap.',
                        style: TextStyle(fontSize: 10.sp),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  child: Image.asset('assets/images/body.png'),
                ),
                Container(
                  width: 200.w,
                  height: 120.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Deteksi Tubuh Penuh',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pastikan seluruh tubuh Anda terlihat di kamera dan tidak terpotong. Kamera harus dapat melihat seluruh tubuh Anda dari kepala hingga kaki untuk hasil deteksi yang optimal.',
                        style: TextStyle(fontSize: 10.sp),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetectPage(selectedPose: pose),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Mengatur sudut tombol
                      ),
                      backgroundColor: AppColors.primaryElement,
                      textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    child: const Text(
                      'OPEN CAMERA',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
