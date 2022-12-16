import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../data/model/projects_model.dart';
import '../screens/TaskDetailsScreen.dart';

class TaskDetailsCard extends StatelessWidget {
  ProjectData projectData;
   TaskDetailsCard({
    Key? key,
    required this.projectData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: KSize.getHeight(context, 20.8), bottom: KSize.getWidth(context, 18.8)),
      child: Stack(children: [
        Transform.rotate(
          angle: radians(2.93),
          child: Container(
            height: KSize.getHeight(context, 172),
            width: KSize.getWidth(context, 327),
            decoration: BoxDecoration(color: KColor.periwinkleCrayola, borderRadius: BorderRadius.circular(30)),
          ),
        ),
        Container(
          padding:const EdgeInsets.all(30),
          height: KSize.getHeight(context, 200),
          width: KSize.getWidth(context, 327),
          decoration: BoxDecoration(color: KColor.ultramarineBlue, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(projectData.title,
                          style: KTextStyle.headline4.copyWith(color: KColor.white, fontSize: 26.0, fontWeight: FontWeight.bold, height: 28 / 26)),
                      SizedBox(height: KSize.getHeight(context, 24)),
                      Text("${projectData.teams.length} Teams , ${projectData.users.length} Users",
                          style: KTextStyle.caption.copyWith(
                            color: KColor.cultured1,
                            fontSize: 11.0,
                          )),
                      SizedBox(height: KSize.getHeight(context, 24)),

                      GestureDetector(
                        onHorizontalDragUpdate: (details) async {
                          int sensitivity = 8;
                          if (details.delta.dx > sensitivity) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TaskDetailsScreen(projectData: projectData,)),
                            );
                          }
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TaskDetailsScreen(projectData: projectData,)),
                          );
                        },
                        child: Container(
                          width: KSize.getWidth(context, 100),
                          height: KSize.getHeight(context, 38),
                          decoration: BoxDecoration(color: KColor.white.withOpacity(0.40), borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: KSize.getWidth(context, 38),
                                height: KSize.getHeight(context, 38),
                                decoration:const BoxDecoration(color: KColor.white, shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(
                                    "assets/png/Arrow - Down 2.png",
                                    width: KSize.getWidth(context, 6),
                                    height: KSize.getHeight(context, 11),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text("Details",
                                      style: KTextStyle.subtitle2
                                          .copyWith(color: KColor.white, fontSize: 12, fontWeight: FontWeight.normal, height: 14 / 12)))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(children: [
                Transform.rotate(
                  angle: radians(-5.83),
                  child: Container(
                    height: KSize.getHeight(context, 129),
                    width: KSize.getWidth(context, 50.0),
                    decoration: BoxDecoration(color: KColor.white.withOpacity(0.40), borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 12.5, vertical: 10),
                  height: KSize.getHeight(context, 129),
                  width: KSize.getWidth(context, 50.0),
                  decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.circular(20)),
                  child:Stack(
                    children: [
                      Container(
                        height: KSize.getHeight(context, 25.0),
                        width: KSize.getWidth(context, 25.0),
                        decoration:const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/png/img2.png'))),
                      ),
                      Positioned(
                        top: KSize.getHeight(context, 20),
                        child: Container(
                          height: KSize.getHeight(context, 25.0),
                          width: KSize.getWidth(context, 25.0),
                          decoration:const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/png/pro1.png'))),
                        ),
                      ),
                      Positioned(
                        top: KSize.getHeight(context, 40),
                        child: Container(
                          height: KSize.getHeight(context, 25.0),
                          width: KSize.getWidth(context, 25.0),
                          decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/png/img41.png'))),
                        ),
                      ),
                      Positioned(
                        top: KSize.getHeight(context, 60),
                        child: Container(
                          height: KSize.getHeight(context, 25.0),
                          width: KSize.getWidth(context, 25.0),
                          decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/png/img44.png'))),
                        ),
                      ),
                      Positioned(
                        top: KSize.getHeight(context, 80),
                        child: Container(
                            height: KSize.getHeight(context, 25.0),
                            width: KSize.getWidth(context, 25.0),
                            decoration:const BoxDecoration(color: KColor.ultramarineBlue, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(
                                  "assets/png/plus.png",
                                  height: KSize.getHeight(context, 9.5),
                                  width: KSize.getWidth(context, 9.5),
                                ))),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
