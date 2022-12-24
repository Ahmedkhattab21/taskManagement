import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtasks/buisiness_logic/cuibits/AuthCubit.dart';

import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../../data/model/profile_model.dart';
import '../../services/services.dart';
import '../widgets/KAppbar.dart';
import 'EditProfileScreen.dart';
import 'WelcomeScreen.dart';

class ProfileScreen extends StatelessWidget {
  final bool hideBackButton;
  ProfileScreen({this.hideBackButton = false});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states) {
        if(states is OnHomeLoadingState){
          return  const Scaffold(
              body: Center(child:CircularProgressIndicator()));
        }
        else if(states is OnGetProfileErrorState){
          return const Scaffold(
            body: Center(
              child: Text("there is error for the user data",style: KTextStyle.sectionTitle,),
            ),
          );
        }
        else if(states is OnGetProfileState){
          Data data=states.data;
         return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: KColor.white,
            appBar: AppBar(
              leading: hideBackButton
                  ? null
                  : Padding(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/png/Back2.png",
                      height: KSize.getHeight(context, 30),
                      width: KSize.getWidth(context, 30),
                    ),
                    onTap: () {
                      AuthCubit.get(context).getAllProjects();
                      Navigator.pop(context);
                    },
                  )),
              title:const Text("Profile", style: KTextStyle.appBar),
              backgroundColor: KColor.white,
              elevation: 0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Profile Pic, Name, Email
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: KSize.getHeight(context, 46.0)),
                          Container(
                            height: KSize.getHeight(context, 100.0),
                            width: KSize.getWidth(context, 100.0),
                            child:const CircleAvatar(backgroundImage: AssetImage("assets/png/pro1.png")),
                          ),
                          SizedBox(height: KSize.getHeight(context, 10.0)),
                          Text(
                            data.name,
                            style: KTextStyle.headline5.copyWith(fontSize: 26, fontWeight: FontWeight.w600, height: 28 / 26),
                          ),
                          SizedBox(height: KSize.getHeight(context, 10.0)),
                          Text(data.email,
                              style: KTextStyle.subtitle2.copyWith(
                                fontSize: 12,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                color: KColor.dimGray,
                              )),
                        ],
                      )),
                  SizedBox(height: KSize.getHeight(context, 30.0)),

                  const Divider(height: 4.0),
                  SizedBox(height: KSize.getHeight(context, 18.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Account Setting", style: KTextStyle.sectionTitle),
                        SizedBox(height: KSize.getHeight(context, 13.0)),
                        GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Your Info",
                                      style: KTextStyle.body1.copyWith(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: KColor.eerieBlack,
                                        letterSpacing: 0,
                                        height: 16 / 16,
                                      ),
                                    ),
                                    SizedBox(height: KSize.getHeight(context, 5.0)),
                                    Text(
                                      "Edit and view your information",
                                      style: KTextStyle.overline
                                          .copyWith(fontSize: 10, height: 12 / 10, color: KColor.dimGray, fontWeight: FontWeight.normal, letterSpacing: 0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: KSize.getHeight(context, 17.0),
                                      width: KSize.getWidth(context, 17.0),
                                      decoration:const BoxDecoration(color: KColor.ultramarineBlue, shape: BoxShape.circle),
                                      child: Center(
                                          child: Text(
                                            "1",
                                            style: KTextStyle.subtitle2.copyWith(color: KColor.white, fontSize: 10.0),
                                          )),
                                    ),
                                    SizedBox(height: KSize.getWidth(context, 14.0)),
                                    Image.asset(
                                      "assets/png/infoicon.png",
                                      height: KSize.getHeight(context, 16.0),
                                      width: KSize.getWidth(context, 16.0),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            AuthCubit.get(context).nameController.text=data.name;
                            AuthCubit.get(context).emailController.text=data.email;
                            AuthCubit.get(context).phoneController.text=data.phone.toString().substring(3);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context)=> EditProfileScreen(data:data)),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 14.0)),
                  const Divider(height: 4.0),
                  const SizedBox(height: 20,),
                  /// Logout Button
                  SizedBox(height: KSize.getHeight(context, 64.0)),
                  Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: ()async {
                          print(1);
                          AuthCubit.get(context).logout();
                          print(2);
                          if(isLogByGoogle)
                            await GoogleSignInApi.logout();
                          print(3);
                          Navigator
                              .pushNamedAndRemoveUntil(context,onBoardingScreen, (Route<dynamic> route) => false);

                        },
                        child: Text(
                          "Log Out",
                          style: KTextStyle.sectionTitle.copyWith(color: KColor.red),
                        ),
                      )),
                  SizedBox(height: KSize.getHeight(context, 50.0)),
                ],
              ),
            ),
          );
        }
        else{
          return   const Scaffold(
          body: Center(child:CircularProgressIndicator()));
        }
      }

    );
  }
}


class Divider extends StatelessWidget {
  final height;

  const Divider({ this.height});

  @override
  Widget build(BuildContext context) {
    return Container(height: KSize.getHeight(context, height), color: KColor.cultured2);
  }
}
