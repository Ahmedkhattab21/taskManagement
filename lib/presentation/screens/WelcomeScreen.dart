
import 'package:flutter/material.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    onPressed() {
      Navigator.pushReplacementNamed(context, onBoardingScreen);
    }
    return Center(
      child: Scaffold(
        backgroundColor: KColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 19.0)),
                  Center(
                    child: Container(
                      width: KSize.getWidth(context, 311.37),
                      height: KSize.getHeight(context, 364),
                      decoration:const BoxDecoration(image: DecorationImage(image: AssetImage("assets/png/Ai.png"))),
                    ),
                  ),
                  Text("Task Management", style: KTextStyle.body2.copyWith(fontWeight: FontWeight.bold, color: KColor.ultramarineBlue)),
                  SizedBox(height: KSize.getHeight(context, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Let's Create\na Space\nFor Your\nWorkflows.",
                          style: KTextStyle.headline4.copyWith(fontSize: 40, height: 48 / 40, fontWeight: FontWeight.bold)),
                      Stack(children: [
                        Container(
                          child: Image.asset("assets/png/Rectngl3.png", height: 197),
                        ),
                        Positioned(
                            right: 10,
                            top: 85,
                            child: GestureDetector(
                              onTap: onPressed,
                              child: Image.asset("assets/png/arrow_forward.png"),
                            ))
                      ]),
                    ],
                  ),
                  SizedBox(height: KSize.getHeight(context, 31)),
                  KButton(
                    title: 'Get Started',
                    buttonTextStyle: KTextStyle.button.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    buttonBorderRadius: 10,
                    buttonHeight: 40,
                    buttonWidth: 130,
                    onPressedCallback: onPressed,
                  ),
                  SizedBox(height: KSize.getHeight(context, 80.0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


