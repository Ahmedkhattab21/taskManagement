import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../widgets/TaskCard.dart';
import '../widgets/TaskDetailsCard.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      appBar: AppBar(
        backgroundColor: KColor.white,
        elevation: 0.0,
        leadingWidth: 68,
        leading: GestureDetector(
          child: Container(
            padding:const EdgeInsets.all(2.0),
            margin: EdgeInsets.only(left: KSize.getWidth(context, 24)),
            height: KSize.getHeight(context, 40),
            width: KSize.getWidth(context, 40),
            decoration: BoxDecoration(
              border: Border.all(color: KColor.ultramarineBlue, width: 1.0),
              shape: BoxShape.circle,
            ),
            child:const CircleAvatar(
              backgroundImage: AssetImage("assets/png/pro1.png"),
            ),
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfileScreen()),
            // );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            children: [
              /// Date Section
              SizedBox(height: KSize.getHeight(context, 30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: KSize.getHeight(context, 30),
                    width: KSize.getWidth(context, 30),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.white, border: Border.all(color: KColor.platinum, width: 1)),
                    child: Center(
                        child: Image.asset(
                          "assets/png/arr1.png",
                          height: KSize.getHeight(context, 10),
                          width: KSize.getWidth(context, 20),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
                    child: Column(
                      children: [
                        Text("Monday, April 26", style: KTextStyle.subtitle2.copyWith(color: KColor.dimGray, fontSize: 13.0, height: 16 / 13)),
                        SizedBox(height: KSize.getHeight(context, 8)),
                        Text("This Week", style: KTextStyle.headline4.copyWith(fontWeight: FontWeight.bold, fontSize: 26.0, height: 28 / 26)),
                      ],
                    ),
                  ),
                  Container(
                    height: KSize.getHeight(context, 30),
                    width: KSize.getWidth(context, 30),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.white, border: Border.all(color: KColor.platinum, width: 1)),
                    child: Center(
                        child: Image.asset(
                          "assets/png/arr2.png",
                          height: KSize.getHeight(context, 10),
                          width: KSize.getWidth(context, 20),
                        )),
                  ),
                ],
              ),

              /// Task Details Card
              TaskDetailsCard(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Tasks", style: KTextStyle.headline4.copyWith(fontWeight: FontWeight.bold, fontSize: 24.0)),
                  Text("See all", style: KTextStyle.button.copyWith(color: KColor.ultramarineBlue, fontSize: 12))
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 19.0)),
              TaskCard(
                taskTitle: "App Design",
                taskSubTitle: "Team Project Working On Figma",
                numberOfParticipants: 10,
                taskProgress: 75,
              ),
              TaskCard(
                taskTitle: "Illustration",
                taskSubTitle: "Team Project Working On Figma",
                numberOfParticipants: 10,
                taskProgress: 17,
              ),
              TaskCard(
                taskTitle: "3d Making Project",
                taskSubTitle: "Team Project Working On Figma",
                numberOfParticipants: 10,
                taskProgress: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
