
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import 'WelcomeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Center(
      child: EasySplashScreen(
        logo: Image.asset("assets/png/Logo1.png",
        ),
        logoWidth:KSize.getWidth(context, 37),
        title:Text("TrekGo",
            style: KTextStyle.headline4.copyWith(
              fontFamily: 'Montserrat Alternates',
              fontSize: 32.0,
              color: KColor.ultramarineBlue,
              fontWeight: FontWeight.w600,
            )),
        loaderColor: KColor.ultramarineBlue,
        backgroundColor:KColor.white,
        showLoader: true,
        durationInSeconds: 2,
        navigator: const WelcomeScreen(),
      ),
    );
  }

}
