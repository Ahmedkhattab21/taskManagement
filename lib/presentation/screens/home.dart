import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wtasks/data/model/createProjReqest_model.dart' as mm;

import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../../data/model/projects_model.dart';
import '../../data/repository/Repository.dart';
import '../../data/web_services/web_services.dart';
import '../widgets/TaskCard.dart';
import '../widgets/TaskDetailsCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states) {
        if(states is OnHomeLoadingState){
          return  const Scaffold(
              body: Center(child:CircularProgressIndicator()));
        }
        else if(states is OnEmptyProjectsState){
          return const Scaffold(
              body:Center(child: Text("Empty Data"))
          );
        }
        else if(states is OnGetProjectsErrorState){
          String error=states.error;
          return const Scaffold(
              body:Center(child: Text("Error inn get data"))
          );
        }
        else if(states is OnCreateTeamErrorState){
          return const Scaffold(
            body: Center(child: Text("Element is found")),
          );
        }
        else{
          List<ProjectData> myProjects=states is OnGetProjectsSuccessState? states.projects:[];

          if(myProjects.isEmpty){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          else{
            myProjects.sort((a,b)=> b.createdAt.compareTo(a.createdAt));
            ProjectData firstElement=myProjects[0];
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
                  onTap: () async{

                    Repository(WebServices()).createProject("Waqty22", "12-11-2023" ,
                       " ipsum dolor sit amet ",mm.Member(teams:[1],users:[1]));
                   // await AuthCubit.get(context).getProfile();
                   //  Navigator.pushNamed(
                   //      context, profileScreen);
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
                                Text(DateFormat.MMMMEEEEd().format(DateTime.now()), style: KTextStyle.subtitle2.copyWith(color: KColor.dimGray, fontSize: 13.0, height: 16 / 13)),
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
                      TaskDetailsCard(projectData: firstElement,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("All Projects", style: KTextStyle.headline4.copyWith(fontWeight: FontWeight.bold, fontSize: 24.0)),
                        ],
                      ),
                      SizedBox(height: KSize.getHeight(context, 19.0)),
                      Container(
                        height: KSize.getHeight(context, 300.0),
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index)=> TaskCard(
                              projectData:myProjects[index] ,
                            ),
                          itemCount: myProjects.length,
                        ),
                      ),
                      SizedBox(height: KSize.getHeight(context, 19.0)),
                    ],
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }

}
