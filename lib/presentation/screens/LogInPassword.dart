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


class LogInPassword extends StatelessWidget {
  final String text;

  const LogInPassword({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: KColor.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
              padding: EdgeInsets.only(right: KSize.getWidth(context, 180.0)),
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
                  RichText(
                    text: TextSpan(
                        text: "Using ",
                        style: KTextStyle.subtitle2.copyWith(
                          fontWeight: FontWeight.w400,
                          color: KColor.dimGray,
                          fontSize: 13.0,
                        ),
                        children: [
                          TextSpan(
                              text: text.isEmpty ? 'example@email.com' : text,
                              style: KTextStyle.subtitle2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.0,
                              )),
                          TextSpan(
                            text: " to log in",
                            style: KTextStyle.subtitle2.copyWith(
                              fontWeight: FontWeight.w400,
                              color: KColor.dimGray,
                              fontSize: 13.0,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: KSize.getHeight(context, 30)),
                  BlocConsumer<AuthCubit,TaskStates>(
                    listener: (context,states){},
                    builder:(context,states)=> KTextField(
                      controller: AuthCubit.get(context).passwordControllerLogin,
                      text: "YOUR PASSWORD",
                      isPasswordField: true,
                      hintText: "Password",

                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 40)),
                  KButton(
                    title: "Continue",
                    onPressedCallback: () {
                      // Navigator.of(context)
                      //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => KBottomNavigationBar()), (Route<dynamic> route) => false);
                    },
                  )
                ],
              )),
        ));
  }
}
