import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spinemotion_app/pages/terapipage/widgets/camera_instruction.dart';

import '../detectionpage/detect_page.dart';

class BridgePosePage extends StatelessWidget {
  const BridgePosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bridge Pose'),
        ),
        body: Container(
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
                      "# 6 Seated Wall Angels",
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
                          '15',
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Min',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 10,
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
                            size: 40,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '134',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(40),
                        child: Image(
                          image: AssetImage('assets/images/seated_wall.png'),
                          height: 500,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Posisi Awal:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Duduk tegak di lantai dengan punggung menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Pastikan kepala, bahu, punggung, dan pinggul bersentuhan dengan dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Gerakan:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Letakkan tangan di samping tubuh dengan telapak tangan menghadap ke depan, lengan lurus dan menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Dorong lengan secara perlahan-lahan ke atas kepala, menjaga lengan tetap menyentuh dinding sebanyak mungkin.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "3. Luruskan lengan ke atas kepala semaksimal mungkin tanpa merenggangkan punggung dari dinding.",
                          style: TextStyle(
                            fontSize: 16,
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
                                  builder: (context) => InstructionCamera(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 30,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Mengatur sudut tombol
                              ),
                              backgroundColor: Colors.blue.shade700,
                              textStyle: const TextStyle(
                                fontSize: 30,
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
        ));
  }
}

class ChestOpenerStretchPage extends StatelessWidget {
  const ChestOpenerStretchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chest Opener Stretch'),
        ),
        body: Container(
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
                      "# 6 Seated Wall Angels",
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
                          '15',
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Min',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 10,
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
                            size: 40,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '134',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(40),
                        child: Image(
                          image: AssetImage('assets/images/seated_wall.png'),
                          height: 500,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Posisi Awal:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Duduk tegak di lantai dengan punggung menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Pastikan kepala, bahu, punggung, dan pinggul bersentuhan dengan dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Gerakan:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Letakkan tangan di samping tubuh dengan telapak tangan menghadap ke depan, lengan lurus dan menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Dorong lengan secara perlahan-lahan ke atas kepala, menjaga lengan tetap menyentuh dinding sebanyak mungkin.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "3. Luruskan lengan ke atas kepala semaksimal mungkin tanpa merenggangkan punggung dari dinding.",
                          style: TextStyle(
                            fontSize: 16,
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
                                  builder: (context) => InstructionCamera(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 30,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Mengatur sudut tombol
                              ),
                              backgroundColor: Colors.blue.shade700,
                              textStyle: const TextStyle(
                                fontSize: 30,
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
        ));
  }
}

class CobraPosePage extends StatelessWidget {
  const CobraPosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cobra Pose'),
      ),
      body: Center(
        child: Text('Detail tentang Cobra Pose'),
      ),
    );
  }
}

class MountainPosePage extends StatelessWidget {
  const MountainPosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mountain Pose'),
      ),
      body: Center(
        child: Text('Detail tentang Mountain Pose'),
      ),
    );
  }
}

class PushUpToDownDogPage extends StatelessWidget {
  const PushUpToDownDogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Push Up to Down Dog'),
        ),
        body: Container(
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
                      "# 6 Seated Wall Angels",
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
                          '15',
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Min',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 10,
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
                            size: 40,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '134',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(40),
                        child: Image(
                          image: AssetImage('assets/images/seated_wall.png'),
                          height: 500,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Posisi Awal:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Duduk tegak di lantai dengan punggung menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Pastikan kepala, bahu, punggung, dan pinggul bersentuhan dengan dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Gerakan:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Letakkan tangan di samping tubuh dengan telapak tangan menghadap ke depan, lengan lurus dan menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Dorong lengan secara perlahan-lahan ke atas kepala, menjaga lengan tetap menyentuh dinding sebanyak mungkin.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "3. Luruskan lengan ke atas kepala semaksimal mungkin tanpa merenggangkan punggung dari dinding.",
                          style: TextStyle(
                            fontSize: 16,
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
                                  builder: (context) => InstructionCamera(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 30,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Mengatur sudut tombol
                              ),
                              backgroundColor: Colors.blue.shade700,
                              textStyle: const TextStyle(
                                fontSize: 30,
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
        ));
  }
}

class SeatedWallAngelsPage extends StatelessWidget {
  const SeatedWallAngelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Seated Wall Angels'),
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
                        "# 6 Seated Wall Angels",
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
                            '15',
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
                        child: Container(
                          margin: EdgeInsets.all(40),
                          child: Image(
                            image: AssetImage('assets/images/seated_wall.png'),
                            height: 100.h,
                          ),
                        ),
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
                                    builder: (context) => InstructionCamera(),
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
                                backgroundColor: Colors.blue.shade700,
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

class TableTopLiftPage extends StatelessWidget {
  const TableTopLiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Table Top Lift'),
        ),
        body: Container(
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
                      "# 6 Seated Wall Angels",
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
                          '15',
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Min',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 10,
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
                            size: 40,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '134',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(40),
                        child: Image(
                          image: AssetImage('assets/images/seated_wall.png'),
                          height: 500,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Posisi Awal:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Duduk tegak di lantai dengan punggung menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Pastikan kepala, bahu, punggung, dan pinggul bersentuhan dengan dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Gerakan:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // spasi antara judul dan konten
                        Text(
                          "1. Letakkan tangan di samping tubuh dengan telapak tangan menghadap ke depan, lengan lurus dan menyentuh dinding.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2. Dorong lengan secara perlahan-lahan ke atas kepala, menjaga lengan tetap menyentuh dinding sebanyak mungkin.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "3. Luruskan lengan ke atas kepala semaksimal mungkin tanpa merenggangkan punggung dari dinding.",
                          style: TextStyle(
                            fontSize: 16,
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
                                  builder: (context) => InstructionCamera(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 30,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Mengatur sudut tombol
                              ),
                              backgroundColor: Colors.blue.shade700,
                              textStyle: const TextStyle(
                                fontSize: 30,
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
        ));
  }
}

class WarriorPosePage extends StatelessWidget {
  const WarriorPosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warrior Pose'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# 3 Cardio',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '200 Kcal',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  child: const Text(
                    'Basic',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Center(
              child: Image(
                image: AssetImage('assets/images/warrior.png'),
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Min',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '134',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('START PRACTICE'),
            ),
          ],
        ),
      ),
    );
  }
}
