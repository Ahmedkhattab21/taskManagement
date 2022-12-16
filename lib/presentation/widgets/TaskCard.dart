import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtasks/buisiness_logic/cuibits/AuthCubit.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../../data/model/projects_model.dart';
import '../../data/repository/Repository.dart';
import '../../data/web_services/web_services.dart';
import '../screens/TaskDetailsScreen.dart';


class TaskCard extends StatelessWidget {
  ProjectData projectData;

   TaskCard({
    Key? key,
    required this.projectData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => TaskDetailsScreen(projectData: projectData,)),

        );
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
                  child: Text(projectData.title, style: KTextStyle.headline6),
                ),
                Text("${projectData.teams.length} Teams ",
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
                        ],
                      ),
                      SizedBox(
                        width: KSize.getWidth(context, 70),
                      ),
                      Text("${projectData.users.length} participants",
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
                percent: projectData.users.length / 100,
                center: Text("${projectData.users.length}", style:const TextStyle(color: KColor.ultramarineBlue)),
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
