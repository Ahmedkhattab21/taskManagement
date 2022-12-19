import 'package:flutter/material.dart';
import 'package:wtasks/buisiness_logic/cuibits/AuthCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../widgets/button.dart';


class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states) {
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
          title:const Text(
            "Create Project",
            style: KTextStyle.appBar,
          ),
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
                SizedBox(height: KSize.getHeight(context, 40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: KSize.getHeight(context, 40.0),
                      width: KSize.getWidth(context, 40.0),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: KColor.mediumSpringGreen),
                    ),
                    SizedBox(width: KSize.getWidth(context, 26.0)),
                    Expanded(
                      child: TextField(
                        controller: AuthCubit.get(context).projectNameController,
                        textAlignVertical: TextAlignVertical.center,
                        cursorHeight: 26,
                        decoration:const InputDecoration(border: InputBorder.none, hintText: "Project Name", hintStyle: TextStyle(fontFamily: "Mulish")),
                      ),
                    )
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Assigned To
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: KSize.getHeight(context, 48.0),
                          width: KSize.getWidth(context, 48.0),
                          decoration: BoxDecoration(color: KColor.cultured5, shape: BoxShape.circle),
                          child: Center(
                              child: Image.asset(
                                "assets/png/Profile22.png",
                                height: KSize.getHeight(context, 21.0),
                                width: KSize.getWidth(context, 18.6),
                              )),
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
                           Container(
                              width: 100,
                              child: const TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle: TextStyle(fontSize: 16,color: Color(0xff1E1E1E),fontWeight: FontWeight.w600),
                                    isDense: true
                                ),
                              ),
                            )


                          ],
                        )
                      ],
                    ),

                    SizedBox(width: KSize.getWidth(context, 25)),

                    /// Deadline
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              await AuthCubit.get(context).changeDate(context);},
                            child: Container(
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
                          ),
                          SizedBox(width: KSize.getWidth(context, 11)),
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
                                Text(AuthCubit.get(context).endDate==null?DateFormat.MMMMEEEEd().format(DateTime.now()):
                                    DateFormat.MMMMEEEEd().format(AuthCubit.get(context).endDate!),
                                    style: KTextStyle.subtitle1.copyWith(fontFamily: 'Popppins', height: 18 / 16, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 30)),
                Text(
                  "Add Team Member",
                  style: KTextStyle.headline6.copyWith(
                    fontSize: 18,
                    height: 20 / 18,
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 15.0)),
                GestureDetector(
                  child: Container(
                    height: KSize.getHeight(context, 38.54),
                    width: KSize.getWidth(context, 38.54),
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: KColor.ultramarineBlue),
                    child: Image.asset("assets/png/plus.png"),
                  ),
                  onTap: ()async {
                    await AuthCubit.get(context).getUsers();
                    Navigator.pushNamed(context,selectMemberScreen);
                  },
                ),
                SizedBox(height: KSize.getHeight(context, 30.46)),
                Text(
                  "Add Description",
                  style: KTextStyle.headline6.copyWith(
                    fontSize: 18,
                    height: 20 / 18,
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 15.0)),
                Container(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 10.0)),
                  height: KSize.getHeight(context, 161),
                  decoration: BoxDecoration(color: KColor.cultured5, borderRadius: BorderRadius.circular(12.0)),
                  child: TextField(
                    controller: AuthCubit.get(context).projectDescriptionController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type here",
                        hintStyle: KTextStyle.caption.copyWith(
                          color: KColor.dimGray,
                          fontSize: 11.0,
                        )),
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 50.0)),
                Center(
                  child: KButton(
                    title: "Create Now",
                    buttonTextStyle: KTextStyle.button.copyWith(fontSize: 18, height: 20 / 18),
                    onPressedCallback: () {
                      AuthCubit.get(context).createProject();
                      if(AuthCubit.get(context).projectNameController.text.isEmpty){
                        return;
                      }if(AuthCubit.get(context).projectDescriptionController.text.isEmpty){
                        return;
                      }
                      bool isTrue=false;
                      for(var i in AuthCubit.get(context).selectMemberModel){
                        if( i['isSelect']==true){
                          isTrue=true;
                          break;
                        }
                      }
                      if(!isTrue){
                        return;
                      }
                      Navigator
                          .pushNamedAndRemoveUntil(context,bottomNavigationBar, (Route<dynamic> route) => false);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}
