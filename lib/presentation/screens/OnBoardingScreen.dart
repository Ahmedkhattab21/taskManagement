import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtasks/buisiness_logic/cuibits/AuthCubit.dart';

import '../../buisiness_logic/cuibits/OnBordringCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../../data/web_services/web_services.dart';
import '../../services/services.dart';
import '../widgets/button.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBordringCubit,TaskStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(height: KSize.getHeight(context, 65.0)),

              ///Slider
              Container(
                height: KSize.getHeight(context, 510),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    OnBordringCubit.get(context).changingPage(index);
                  },
                  controller: OnBordringCubit.get(context).controller,
                  itemCount: OnBordringCubit.get(context).pages.length,
                  itemBuilder: (context, int index) {
                    return OnBordringCubit.get(context).pages[index];
                  },
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: KSize.getWidth(context, 24.0), top: KSize.getHeight(context, 9)),
                      child: DotsIndicator(
                        dotsCount:OnBordringCubit.get(context).pages.length,
                        position: OnBordringCubit.get(context).currentPage.toDouble(),
                        decorator:const DotsDecorator(activeColor: KColor.ultramarineBlue),
                      ),
                    ),
                    SizedBox(height: KSize.getHeight(context, 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KButton(
                          title: 'Sign in with Google',
                          buttonTextStyle: KTextStyle.button.copyWith(
                            fontSize: 15,
                            height: 17 / 15,
                          ),
                          buttonHeight: 62,
                          buttonWidth: 311,
                          buttonBorderRadius: 20,
                          onPressedCallback: () async{
                           await AuthCubit.get(context).googleLogin();
                           Navigator
                               .pushNamedAndRemoveUntil(context,bottomNavigationBar, (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: KSize.getHeight(context, 16)),
                    Center(
                      child: GestureDetector(
                        child: RichText(
                          text: TextSpan(
                              text: "Already have an account?",
                              style: KTextStyle.body2,
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = ()async {
                                        fromSign=false;
                                        Navigator.pushNamed(context, logInEmail);
                                      },
                                    text: " Sign in",
                                    style: KTextStyle.body2.copyWith(color: KColor.ultramarineBlue))
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: KSize.getHeight(context, 80))
                  ]),
            ]),
          ),
        );
      },
    );
  }
}

