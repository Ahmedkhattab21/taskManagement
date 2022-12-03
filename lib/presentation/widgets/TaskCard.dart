import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';


class TaskCard extends StatelessWidget {
  final String taskTitle;
  final String taskSubTitle;
  final int numberOfParticipants;
  final int taskProgress;

  const TaskCard({
    Key? key,
    required this.taskTitle,
    required this.taskSubTitle,
   required this.numberOfParticipants,
    required this.taskProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, taskDetailsScreen);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: KSize.getHeight(context, 16.0)),
        padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
        decoration: BoxDecoration(color: KColor.cultured6, borderRadius: BorderRadius.circular(25.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: KSize.getHeight(context, 18.0), bottom: KSize.getHeight(context, 5.0)),
                  child: Text(taskTitle, style: KTextStyle.headline6),
                ),
                Text(taskSubTitle,
                    style: KTextStyle.caption.copyWith(
                      color: KColor.dimGray,
                      fontSize: 11.0,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: KSize.getHeight(context, 18.0), bottom: KSize.getHeight(context, 16.07)),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: KSize.getHeight(context, 19.93),
                            width: KSize.getWidth(context, 19.93),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: KColor.white,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                image:const DecorationImage(image: AssetImage('assets/png/img2.png'))),
                          ),
                          Positioned(
                            left: KSize.getWidth(context, 14.5),
                            child: Container(
                              height: KSize.getHeight(context, 19.93),
                              width: KSize.getWidth(context, 19.93),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.white,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  image:const DecorationImage(image: AssetImage('assets/png/img21.png'))),
                            ),
                          ),
                          Positioned(
                            left: KSize.getWidth(context, 29),
                            child: Container(
                              height: KSize.getHeight(context, 19.93),
                              width: KSize.getWidth(context, 19.93),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.white,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  image:const DecorationImage(image: AssetImage('assets/png/img44.png'))),
                            ),
                          ),
                          Positioned(
                            left: KSize.getWidth(context, 43.5),
                            child: Container(
                                height: KSize.getHeight(context, 19.93),
                                width: KSize.getWidth(context, 19.93),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.white,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Image.asset("assets/png/img41.png"))),
                          ),
                          Positioned(
                            left: KSize.getWidth(context, 58),
                            child: Container(
                              height: KSize.getHeight(context, 19.93),
                              width: KSize.getWidth(context, 19.93),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.white,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  image:const DecorationImage(image: AssetImage('assets/png/Image1.png'))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: KSize.getWidth(context, 70),
                      ),
                      Text("$numberOfParticipants participants",
                          style: KTextStyle.caption.copyWith(
                            color: KColor.dimGray,
                            fontSize: 11.0,
                          ))
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 4.0,
                percent: taskProgress / 100,
                center: Text("$taskProgress%", style:const TextStyle(color: KColor.ultramarineBlue)),
                backgroundColor: KColor.lightGray,
                progressColor: KColor.ultramarineBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
