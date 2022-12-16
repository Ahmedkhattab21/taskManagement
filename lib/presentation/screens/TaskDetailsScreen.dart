import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../buisiness_logic/cuibits/TaskDetailsCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../data/model/projects_model.dart';



class TaskDetailsScreen extends StatelessWidget {
  ProjectData projectData;
  TaskDetailsScreen({required this.projectData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskDetailsCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states)=> Scaffold(
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
                  Navigator.pop(context);
                },
              )),
          title: Text("Project Details", style: KTextStyle.appBar),
          backgroundColor: KColor.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: KSize.getHeight(context, 29)),
                //App Design
                Text(
                  projectData.title,
                  style: KTextStyle.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    height: 32 / 30,
                  ),
                ),

                SizedBox(height: KSize.getHeight(context, 29)),
                Row(
                  children: [
                    /// Assigned To
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            height: KSize.getHeight(context, 48),
                            width: KSize.getWidth(context, 48),
                            decoration:const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/png/pro1.png")),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 11),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Assigned to",
                                    style: KTextStyle.subtitle2.copyWith(
                                        fontFamily: 'Popppins', color: KColor.dimGray, fontSize: 13, height: 15 / 13, fontWeight: FontWeight.normal)),
                                SizedBox(
                                  height: KSize.getHeight(context, 8),
                                ),
                                //"${projectData.users.map((e) => "${e.name }\n ffffccccccccccccc fffffffff ")}".substring(1).replaceAll(")","")
                              Text("${projectData.users.map((e) => "${e.name }\n ")}".substring(1).replaceAll(")",""),
                                   overflow: TextOverflow.fade, //new
                                   style: KTextStyle.subtitle1.copyWith(fontFamily: 'Popppins', height: 18 / 16, fontWeight: FontWeight.w600)
                              ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: KSize.getWidth(context, 25)),

                    /// Deadline
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            height: KSize.getHeight(context, 48),
                            width: KSize.getWidth(context, 48),
                            decoration:const BoxDecoration(
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Due date",
                                    style: KTextStyle.subtitle2.copyWith(
                                        fontFamily: 'Popppins', color: KColor.dimGray, fontSize: 13, height: 15 / 13, fontWeight: FontWeight.normal)),
                                SizedBox(
                                  height: KSize.getHeight(context, 8),
                                ),
                                Text(DateFormat.MMMd().format(projectData.end),
                                    style: KTextStyle.subtitle1.copyWith(fontFamily: 'Popppins', height: 18 / 16, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: KSize.getWidth(context, 25)),

                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 29)),
                Text("Description", style: KTextStyle.headline6.copyWith(fontSize: 18, height: 20 / 18)),
                SizedBox(height: KSize.getHeight(context, 5)),
                Text(projectData.description,
                    style: KTextStyle.subtitle1.copyWith(color: KColor.dimGray, fontSize: 14, height: 24 / 14)),
                SizedBox(height: KSize.getHeight(context, 29)),
                Text("Team Member", style: KTextStyle.headline6.copyWith(fontSize: 18, height: 20 / 18)),
                SizedBox(height: KSize.getHeight(context, 7)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: KSize.getWidth(context,200),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: KSize.getHeight(context, 38.54),
                              width: KSize.getWidth(context, 38.54),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.white,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage('assets/png/img2.png'))),
                            ),
                            Positioned(
                              left: KSize.getWidth(context, 23.0),
                              child: Container(
                                height: KSize.getHeight(context, 38.54),
                                width: KSize.getWidth(context, 38.54),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: KColor.white,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage('assets/png/img21.png'))),
                              ),
                            ),
                            Positioned(
                              left: KSize.getWidth(context, 46.0),
                              child: Container(
                                height: KSize.getHeight(context, 38.54),
                                width: KSize.getWidth(context, 38.54),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: KColor.white,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage('assets/png/img44.png'))),
                              ),
                            ),
                            Positioned(
                              left: KSize.getWidth(context, 69.0),
                              child: Container(
                                  height: KSize.getHeight(context, 38.54),
                                  width: KSize.getWidth(context, 38.54),
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
                              left: KSize.getWidth(context, 92.0),
                              child: Container(
                                height: KSize.getHeight(context, 38.54),
                                width: KSize.getWidth(context, 38.54),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: KColor.white,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage('assets/png/Image1.png'))),
                              ),
                            ),
                          ],
                        )),
                    CircularPercentIndicator(
                      radius: 50.0,
                      lineWidth: 4.0,
                      percent: 0.5,
                      center: Text(projectData.users.length.toString(), style: TextStyle(color: KColor.ultramarineBlue)),
                      backgroundColor: KColor.lightGray,
                      progressColor: KColor.ultramarineBlue,
                    ),
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 34)),
                Text("Today Update", style: KTextStyle.headline6.copyWith(fontSize: 18, height: 20 / 18)),
                SizedBox(height: KSize.getHeight(context, 15)),
                ListView.builder(
                    itemCount: taskListModel.length,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            TaskDetailsCubit.get(context).MakeTaskChange(index);
                              // taskListModel[index]['isSelected'] = !taskListModel[index]['isSelected'];

                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: KSize.getHeight(context, 20.0)),
                            height: KSize.getHeight(context, 60),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: taskListModel[index]['isSelected'] ? KColor.ultramarineBlue : KColor.platinum),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20), vertical: KSize.getHeight(context, 15)),
                                    height: KSize.getHeight(context, 30),
                                    width: KSize.getWidth(context, 30),
                                    decoration: BoxDecoration(border: Border.all(width: 1.0, color: KColor.platinum), shape: BoxShape.circle),
                                    child: Center(
                                      child: Container(
                                        height: KSize.getHeight(context, 16),
                                        width: KSize.getWidth(context, 16),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: taskListModel[index]['isSelected'] ? KColor.ultramarineBlue : Colors.transparent),
                                      ),
                                    )),
                                Container(
                                  child: RichText(
                                    text: TextSpan(text: taskListModel[index]['title'], style: KTextStyle.sectionTitle,
                                        children: [
                                      taskListModel[index]['isSelected']
                                          ? TextSpan(
                                          text: "(Complete)",
                                          style: KTextStyle.body2.copyWith(
                                            color: KColor.ultramarineBlue,
                                          ))
                                          : TextSpan(text: "(Pending)", style: KTextStyle.body2.copyWith(color: KColor.honeyYellow))
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ));
                    }),
                SizedBox(height: KSize.getHeight(context, 48)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
