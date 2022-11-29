//
// import 'package:flutter/material.dart';
//
// import '../../constant/k_size.dart';
// import '../../constant/k_textStyle.dart';
// import '../../constant/my_colors.dart';
//
// class KButton extends StatelessWidget {
//   final String title;
//   final Function() onPressedCallback;
//   final TextStyle buttonTextStyle;
//   final double buttonHeight;
//   final double buttonWidth;
//   final double buttonBorderRadius;
//
//   const KButton({
//     required this.title,
//     required this.onPressedCallback,
//     this.buttonTextStyle = KTextStyle.button,
//     this.buttonHeight = 58,
//     this.buttonWidth = 295,
//     this.buttonBorderRadius = 20,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressedCallback,
//       child: Container(
//           height: KSize.getHeight(context, buttonHeight),
//           width: KSize.getWidth(context, buttonWidth),
//           decoration: BoxDecoration(
//             color: KColor.ultramarineBlue,
//             borderRadius: BorderRadius.circular(buttonBorderRadius),
//           ),
//           child: Center(child: Text(title, style: buttonTextStyle))),
//
//     );
//   }
// }
