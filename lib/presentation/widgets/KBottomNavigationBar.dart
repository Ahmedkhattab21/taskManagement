import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wtasks/buisiness_logic/cuibits/AuthCubit.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/string.dart';
import 'button.dart';



class KBottomNavigationBar extends StatelessWidget {
  const KBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states){
        if(states is OnLoadingState){
          return  const Scaffold(
              body: Center(child:CircularProgressIndicator()));
        }
        else if(states is OnLoginErrorState){
          String error=states.error;
          return Scaffold(
            body:AlertDialog(
              backgroundColor: Colors.white,
              title: Text(error),
              content: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(onBoardingScreen, (Route<dynamic> route) => false);
                },
                child: Row(
                  children: const[
                    Spacer(),
                    Text("Exit",style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),
            ),
          );
        }
        else if(states is OnNotLoginState){
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
                      AuthCubit.get(context).changingPage(index);
                    },
                    controller: AuthCubit.get(context).controller,
                    itemCount: AuthCubit.get(context).pages.length,
                    itemBuilder: (context, int index) {
                      return AuthCubit.get(context).pages[index];
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
                          dotsCount:AuthCubit.get(context).pages.length,
                          position: AuthCubit.get(context).currentPage.toDouble(),
                          decorator: DotsDecorator(activeColor: KColor.ultramarineBlue),
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
                            }
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
        }
        else {
           if (states is OnLoginSuccessState){
             AuthCubit.get(context).emailController.clear();
             AuthCubit.get(context).passwordControllerLogin.clear();
             AuthCubit.get(context).currentIndexEqualZero();
          }
           return Scaffold(
            backgroundColor: Colors.white,
            body: AuthCubit.get(context).bottomNavPages[AuthCubit.get(context).currentIndex],
            bottomNavigationBar: Container(
              height: KSize.getHeight(context, 95),
              decoration:const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: KColor.shadowColor, blurRadius: 44, spreadRadius: 0, offset: Offset(0, -15)),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: KSize.getWidth(context, 24.0)),
                      height: KSize.getHeight(context, 50.0),
                      width: KSize.getWidth(context, 50.0),
                      decoration:const BoxDecoration(shape: BoxShape.circle, color: KColor.eerieBlack),
                      child: Center(
                        child: Image.asset(
                          "assets/png/create.png",
                          height: KSize.getHeight(context, 20.0),
                          width: KSize.getWidth(context, 20.0),
                        ),
                      ),
                    ),
                    onTap: () {
                      _showPopup(context);
                    },
                  ),
                  _buildBottomNavItem(context, "assets/png/Home.png", 0),
                  _buildBottomNavItem(context, "assets/png/Filter.png", 1),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildBottomNavItem(BuildContext context, String navIconImg, int navIndex) {
    return GestureDetector(
      onTap: (){
        AuthCubit.get(context).setCurrentIndex(navIndex);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: KSize.getHeight(context, 10)),
            Image.asset(
              navIconImg,
              color: AuthCubit.get(context).currentIndex == navIndex ? KColor.ultramarineBlue : KColor.dimGray,
              height: KSize.getHeight(context, 20.0),
              width: KSize.getWidth(context, 20.0),
            ),
            Image.asset(
              "assets/png/nv.png",
              color: AuthCubit.get(context).currentIndex == navIndex ? KColor.ultramarineBlue : Colors.transparent,
              width: KSize.getWidth(context, 93.38),
            )
          ],
        ),
      ),
    );
  }

  ///////////// create options dialog ///////////////
  void _showPopup(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: KColor.eerieBlack.withOpacity(0.70),
      transitionDuration:const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                height: KSize.getHeight(context, 180),
                width: KSize.getWidth(context, 327),
                margin:const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: KColor.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Positioned(
                  top: KSize.getHeight(context, 19.0),
                  right: KSize.getWidth(context, 16.46),
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/png/cross.png",
                      height: KSize.getHeight(context, 19.0),
                      width: KSize.getWidth(context, 16.46),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
              Positioned(
                top: KSize.getHeight(context, 34.0),
                left: KSize.getWidth(context, 27.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/png/project.png",
                              fit: BoxFit.scaleDown,
                              height: KSize.getHeight(context, 26.0),
                              width: KSize.getWidth(context, 26),
                            ),
                            SizedBox(width: KSize.getWidth(context, 20.0)),
                            Material(
                              child: Text(
                                "Create Project",
                                style: KTextStyle.headline6.copyWith(fontSize: 18, height: 20 / 18),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, createProjectScreen);
                        },
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: KSize.getHeight(context, 18.0)),
                          height: KSize.getHeight(context, 1.0),
                          width: KSize.getWidth(context, 267.0),
                          color: KColor.cultured4),
                      GestureDetector(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/png/mem.png",
                              fit: BoxFit.scaleDown,
                              height: KSize.getHeight(context, 26.0),
                              width: KSize.getWidth(context, 26),
                            ),
                            SizedBox(width: KSize.getWidth(context, 20.0)),
                            Material(
                              child: Text(
                                "Create Team",
                                style: KTextStyle.headline6.copyWith(fontSize: 18, height: 20 / 18),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,createTeamScreen);
                        },
                      ),
                      Container(
                          margin: EdgeInsets.only(top: KSize.getHeight(context, 18.0)),
                          height: KSize.getHeight(context, 1.0),
                          width: KSize.getWidth(context, 267.0),
                          color: KColor.cultured4),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          alignment: Alignment.bottomLeft,
          scale: Tween<double>(
            begin: 0.45,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              reverseCurve: Curves.easeOut,
              parent: anim1,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        );
      },
    );
  }


///////////// create options dialog ///////////////
}
