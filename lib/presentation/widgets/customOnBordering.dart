

import 'package:flutter/material.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';

class CustomOnBoarding extends StatelessWidget {
  final String title;
  final String image;

  const CustomOnBoarding({required this.image,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: KSize.getHeight(context, 61)),
            height: KSize.getHeight(context, 290),
            child: Image.asset(image),
          ),
        ),
        Container(
          height: KSize.getHeight(context, 159),
          margin: EdgeInsets.only(left: KSize.getWidth(context, 24.0)),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(title,
              style: KTextStyle.headline4.copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 40.0,
                height: 48 / 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
