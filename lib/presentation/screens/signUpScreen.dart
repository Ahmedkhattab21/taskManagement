import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtasks/constant/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../widgets/button.dart';
import '../widgets/textFeild.dart';


class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
        listener: (context,states){},
        builder:(context,states)=> Scaffold(
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
                padding: EdgeInsets.only(right: KSize.getWidth(context, 40.0)),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child:const Text("Have Account? Log In", style: KTextStyle.caption2),
                  onPressed: () {
                    Navigator.pushNamed(context, logInEmail);
                  },
                ),
              ),
            ],
            backgroundColor: KColor.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 40.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: KSize.getHeight(context, 60),
                    ),
                    Text("Sign Up",
                        style: KTextStyle.headline4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                        )),
                    SizedBox(height: KSize.getHeight(context, 8)),
                    Text("Sign up to continue.",
                        style: KTextStyle.subtitle2.copyWith(
                          fontWeight: FontWeight.w400,
                          color: KColor.dimGray,
                          fontSize: 13.0,
                        )),
                    SizedBox(height: KSize.getHeight(context, 30)),
                    KTextField(
                      controller: AuthCubit.get(context).emailControllerUp,
                      text: "YOUR EMAIL",
                      hintText: "Email",
                    ),
                    SizedBox(height: KSize.getHeight(context, 30)),
                    KTextField(
                      controller: AuthCubit.get(context).passControllerUp,
                      text: "YOUR PASSWORD",
                      isPasswordField: true,
                      hintText: "Password",
                    ),
                    SizedBox(height: KSize.getHeight(context, 40)),
                    KButton(
                      title: "Continue",
                      onPressedCallback: () {
                        print(AuthCubit.get(context).count);
                        Navigator.pushNamed(context, profileSetup);
                      },
                    )
                  ],
                )),
          )),
    );
  }
}
