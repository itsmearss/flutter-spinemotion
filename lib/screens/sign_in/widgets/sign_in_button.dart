// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class LoginButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;
//
//   const LoginButton({Key? key, required this.onPressed, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 325.w,
//         height: 50.h,
//         margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
//         decoration: BoxDecoration(
//           color: Colors.amber, // Sesuaikan dengan warna yang diinginkan
//           borderRadius: BorderRadius.circular(15.w),
//           border: Border.all(color: Colors.pink), // Sesuaikan dengan warna yang diinginkan
//           boxShadow: [
//             BoxShadow(
//               spreadRadius: 1,
//               blurRadius: 2,
//               offset: Offset(0, 1),
//               color: Colors.grey.withOpacity(0.1),
//             )
//           ],
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.normal,
//               color: Colors.white, // Sesuaikan dengan warna yang diinginkan
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
