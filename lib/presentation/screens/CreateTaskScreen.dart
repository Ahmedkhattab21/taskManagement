import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../widgets/button.dart';


class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
            child: GestureDetector(
              child: Image.asset(
                "assets/png/Back2.png",
                height: KSize.getHeight(context, 30),
                width: KSize.getWidth(context, 30),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )),
        title: Text("Create Task", style: KTextStyle.appBar),
        backgroundColor: KColor.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: KSize.getWidth(context, 24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 37)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //App Design
                      Text(
                        "App Design",
                        style: KTextStyle.headline4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          height: 32 / 30,
                        ),
                      ),
                      SizedBox(height: KSize.getHeight(context, 13)),
                      Text("Task manager ui kit",
                          style: KTextStyle.subtitle1.copyWith(
                            color: KColor.dimGray,
                            fontSize: 16.0,
                            height: 18 / 16,
                          )),
                    ],
                  ),
                  Text("List here",
                      style: KTextStyle.subtitle1.copyWith(
                        color: KColor.ultramarineBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        height: 16 / 14,
                      )),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 29)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Assigned To
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: KSize.getHeight(context, 48),
                          width: KSize.getWidth(context, 48),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/png/Image1.png")),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: KSize.getWidth(context, 11),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Assigned to",
                                style: KTextStyle.subtitle2.copyWith(
                                    fontFamily: 'Popppins', color: KColor.dimGray, fontSize: 13, height: 15 / 13, fontWeight: FontWeight.normal)),
                            SizedBox(
                              height: KSize.getHeight(context, 8),
                            ),
                            Text("Adom Shafi",
                                style: KTextStyle.subtitle1.copyWith(fontFamily: 'Popppins', height: 18 / 16, fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(width: KSize.getWidth(context, 25)),

                  /// Deadline
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: KSize.getHeight(context, 48),
                          width: KSize.getWidth(context, 48),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColor.ultramarineBlue,
                          ),
                          child: Center(
                              child: Image.asset(
                                "assets/png/Calendar1.png",
                                height: KSize.getHeight(context, 20.0),
                                width: KSize.getWidth(context, 18.0),
                              )),
                        ),
                        SizedBox(
                          width: KSize.getWidth(context, 11),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Due date",
                                style: KTextStyle.subtitle2.copyWith(
                                    fontFamily: 'Popppins', color: KColor.dimGray, fontSize: 13, height: 15 / 13, fontWeight: FontWeight.normal)),
                            SizedBox(
                              height: KSize.getHeight(context, 8),
                            ),
                            Text("May 20",
                                style: KTextStyle.subtitle1.copyWith(fontFamily: 'Popppins', height: 18 / 16, fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 38)),
              Text(
                "Add Task Topic",
                style: KTextStyle.headline6.copyWith(
                  fontSize: 18,
                  height: 20 / 18,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 14.0)),
              Container(
                padding: EdgeInsets.only(left: KSize.getWidth(context, 10.0)),
                height: KSize.getHeight(context, 161),
                decoration: BoxDecoration(color: KColor.cultured5, borderRadius: BorderRadius.circular(12.0)),
                child: TextField(
                    decoration: InputDecoration(
                        isDense: false,
                        border: InputBorder.none,
                        hintText: "Type here",
                        hintStyle: KTextStyle.caption.copyWith(
                          color: KColor.dimGray,
                          fontSize: 11.0,
                        ))),
              ),
              SizedBox(height: KSize.getHeight(context, 50.0)),
              Center(
                child: KButton(
                  title: "Create Now",
                  buttonTextStyle: KTextStyle.button.copyWith(fontSize: 18, height: 20 / 18),
                  onPressedCallback: () {
                  //   Navigator.of(context)
                  //       .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => KBottomNavigationBar()), (Route<dynamic> route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
