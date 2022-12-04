import 'package:flutter/material.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../widgets/KAppbar.dart';

class ProfileScreen extends StatefulWidget {
  final bool hideBackButton;
  ProfileScreen({this.hideBackButton = false});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColor.white,
      appBar: KAppbar(title: "Profile", hideBackButton: widget.hideBackButton),
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
                      child: CircleAvatar(backgroundImage: AssetImage("assets/png/pro1.png")),
                    ),
                    SizedBox(height: KSize.getHeight(context, 10.0)),
                    Text(
                      "Adom Shafi",
                      style: KTextStyle.headline5.copyWith(fontSize: 26, fontWeight: FontWeight.w600, height: 28 / 26),
                    ),
                    SizedBox(height: KSize.getHeight(context, 10.0)),
                    Text("hellobesnik@gmail.com",
                        style: KTextStyle.subtitle2.copyWith(
                          fontSize: 12,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          color: KColor.dimGray,
                        )),
                  ],
                )),
            SizedBox(height: KSize.getHeight(context, 30.0)),

            /// Section - Account Setting
            Divider(height: 4.0),
            SizedBox(height: KSize.getHeight(context, 18.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account Setting", style: KTextStyle.sectionTitle),
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
                                decoration: BoxDecoration(color: KColor.ultramarineBlue, shape: BoxShape.circle),
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
                      Navigator.pushNamed(
                        context, editProfileScreen);
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 14.0)),
            Divider(height: 4.0),

            /// Section - Extra
            SizedBox(height: KSize.getHeight(context, 19.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24.0)),
              child: Text("Extra", style: KTextStyle.sectionTitle),
            ),
            SizedBox(height: KSize.getHeight(context, 15.0)),
            SectionItem(text: "Notifications",onPressed: (){}),
            SectionItem(text: "History",onPressed: (){}),
            SectionItem(text: "Help",onPressed: (){}),
            SectionItem(text: "Rate this app",onPressed: (){}),
            SectionItem(text: "Privacy & Policy",onPressed: (){}),

            /// Logout Button
            SizedBox(height: KSize.getHeight(context, 64.0)),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomeScreen()), (Route<dynamic> route) => false);
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
}

class SectionItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  const SectionItem({required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => NotificationScreen()),
        // );
      },
      child: Column(
        children: [
          SizedBox(height: KSize.getHeight(context, 14.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.dimGray,
                      fontSize: 14.0,
                    )),
                Image.asset(
                  "assets/png/infoicon.png",
                  height: KSize.getHeight(context, 16.0),
                  width: KSize.getWidth(context, 16.0),
                )
              ],
            ),
          ),
          SizedBox(height: KSize.getHeight(context, 14.0)),
          Divider(height: 1.0),
        ],
      ),
    );
  }
}

class Divider extends StatelessWidget {
  final height;

  const Divider({this.height});

  @override
  Widget build(BuildContext context) {
    return Container(height: KSize.getHeight(context, height), color: KColor.cultured2);
  }
}
