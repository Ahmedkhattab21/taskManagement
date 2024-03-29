import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../widgets/button.dart';
import '../widgets/textFeild.dart';


class LogInEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){

      },
      builder:(context,states){
        if(fromSign == false){
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: KColor.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                centerTitle: false,
                title: Padding(
                    padding: EdgeInsets.only(left: KSize.getWidth(context, 40.0)),
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/png/Back2.png",
                        height: KSize.getHeight(context, 30),
                        width: KSize.getWidth(context, 30),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: KSize.getWidth(context, 40)),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child:const Text("Create an Account", style: KTextStyle.caption2),
                      onPressed: () {
                        Navigator.pushNamed(context, signUp);
                      },
                    ),
                  ),
                ],
                backgroundColor: KColor.white,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 40)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: KSize.getWidth(context, 75)),
                        Text("Log In",
                            style: KTextStyle.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            )),
                        SizedBox(height: KSize.getHeight(context, 8)),
                        Text("What's your email?",
                            style: KTextStyle.subtitle2.copyWith(
                              fontWeight: FontWeight.w400,
                              color: KColor.dimGray,
                              fontSize: 13.0,
                            )),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        KTextField(
                          controller: AuthCubit.get(context).emailControllerLogin,
                          type: "mail",
                          text: "YOUR EMAIL",
                          hintText: "Email",
                        ),
                        SizedBox(height: KSize.getHeight(context, 40)),
                        KButton(
                          title: "Continue",
                          onPressedCallback: () {
                            if (!AuthCubit.get(context).formKeyemail.currentState!.validate()) {
                              return;
                            }
                            AuthCubit.get(context).formKeyemail.currentState!.save;
                            FocusScope.of(context).unfocus();
                            Navigator.pushNamed(
                              context,
                              logInPassword,
                            );
                          },
                        )
                      ],
                    )),
              ));
        }else{
          if(states is OnRegisterErrorState){
            return Scaffold(
              body:AlertDialog(
                backgroundColor: Colors.white,
                title:const Text("Error in Register OR Account is exist"),

                content: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(onBoardingScreen, (route) => false);
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
          else if(states is OnLoadingState){return const Scaffold(body:Center(child:CircularProgressIndicator()));}
          else{
            return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: KColor.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  centerTitle: false,

                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: KSize.getWidth(context, 40)),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child:const Text("Create an Account", style: KTextStyle.caption2),
                        onPressed: () {
                          Navigator.pushNamed(context, signUp);
                        },
                      ),
                    ),
                  ],
                  backgroundColor: KColor.white,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 40)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: KSize.getWidth(context, 75)),
                          Text("Log In",
                              style: KTextStyle.headline4.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0,
                              )),
                          SizedBox(height: KSize.getHeight(context, 8)),
                          Text("What's your email?",
                              style: KTextStyle.subtitle2.copyWith(
                                fontWeight: FontWeight.w400,
                                color: KColor.dimGray,
                                fontSize: 13.0,
                              )),
                          SizedBox(height: KSize.getHeight(context, 30)),
                          KTextField(
                            controller: AuthCubit.get(context).emailControllerLogin,
                            type: "mail",
                            text: "YOUR EMAIL",
                            hintText: "Email",
                          ),
                          SizedBox(height: KSize.getHeight(context, 40)),
                          KButton(
                            title: "Continue",
                            onPressedCallback: () {
                              if (!AuthCubit.get(context).formKeyemail.currentState!.validate()) {
                                return;
                              }
                              AuthCubit.get(context).formKeyemail.currentState!.save;
                              FocusScope.of(context).unfocus();
                              Navigator.pushNamed(
                                context,
                                logInPassword,
                                arguments: AuthCubit.get(context).passwordControllerLogin.text,
                              );
                            },
                          )
                        ],
                      )),
                ));
          }
        }

      },
    );
  }
}