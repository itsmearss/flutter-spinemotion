// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../common/values/colors.dart';
//
// class InputTextFieldWidget extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final String hintText;
//
//   const InputTextFieldWidget(this.textEditingController, this.hintText, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 325.w,
//       height: 50.h,
//       margin: EdgeInsets.only(bottom: 10.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(15.w)),
//         border: Border.all(color: AppColors.primaryFourthElementText),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 16.w,
//             margin: EdgeInsets.only(left: 17.w),
//             height: 16.w,
//             child: ColorFiltered(
//               colorFilter: const ColorFilter.mode(
//                 Color.fromRGBO(59, 120, 138, 1), // Warna biru yang diinginkan
//                 BlendMode.srcIn,
//               ),
//               child: Image.asset("assets/icons/email.png"),
//             ),
//           ),
//           SizedBox(
//             width: 270.w,
//             height: 50.h,
//             child: TextField(
//               controller: textEditingController,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 disabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 hintStyle: TextStyle(color: AppColors.primarySecondaryElementText),
//               ),
//               style: TextStyle(
//                 color: AppColors.primaryText,
//                 fontFamily: "Avenir",
//                 fontWeight: FontWeight.normal,
//                 fontSize: 14.sp,
//               ),
//               autocorrect: false,
//               obscureText: false,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
