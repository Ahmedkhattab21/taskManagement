import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../data/model/users_model.dart';


class SelectMemberScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states) {
        if(states is OnGetUsersSuccessState){
           List<User> users=states.users;
           users.sort((a,b)=>a.id.compareTo(b.id));
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: KColor.white,
            appBar:AppBar(
              leading: Padding(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/png/Back2.png",
                      height: KSize.getHeight(context, 30),
                      width: KSize.getWidth(context, 30),
                    ),
                    onTap: () {
                      ///

                      Navigator.pop(context);
                    },
                  )),
              title:const Text("Select Member", style: KTextStyle.appBar),
              backgroundColor: KColor.white,
              elevation: 0,
              centerTitle: true,
            ),
            body: Container(
              padding: MediaQuery.of(context).viewInsets,
              margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 30)),
                  Container(
                      width: KSize.getWidth(context, 327),
                      decoration: BoxDecoration(
                        color: KColor.cultured5,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:const TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Color(0xFF1E1E1E), fontSize: 14.0)),
                      )),
                  SizedBox(height: KSize.getHeight(context, 26)),
                  Expanded(
                    ///
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              AuthCubit.get(context).changeIconOnTap(index,users[index].id);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                   const CircleAvatar(
                                      backgroundImage: AssetImage("assets/png/mem.png"),
                                    ),
                                    SizedBox(width: KSize.getWidth(context, 15)),
                                    Text(
                                      users[index].name,
                                      style: KTextStyle.body1.copyWith(fontWeight: FontWeight.w600, height: 18 / 16),
                                    ),
                                  ],
                                ),
                                AuthCubit.get(context).selectMemberModel[index]['isSelect'] == true ?
                                Container(
                                        height: KSize.getHeight(context, 20),
                                        width: KSize.getWidth(context, 20),
                                        decoration:const BoxDecoration(shape: BoxShape.circle, color: KColor.ultramarineBlue),
                                        child: Center(
                                          child: Container(
                                            height: KSize.getHeight(context, 8),
                                            width: KSize.getWidth(context, 8),
                                            decoration:const BoxDecoration(shape: BoxShape.circle, color: KColor.white),
                                          ),
                                        ),
                                )
                                    : Container(
                                  height: KSize.getHeight(context, 20),
                                  width: KSize.getWidth(context, 20),
                                  decoration:const BoxDecoration(shape: BoxShape.circle, color: KColor.cultured3),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else if(states is OnGetUsersErrorState){
          return  Scaffold(
            appBar:AppBar(
              leading: Padding(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/png/Back2.png",
                      height: KSize.getHeight(context, 30),
                      width: KSize.getWidth(context, 30),
                    ),
                    onTap: () {
                      ///

                      Navigator.pop(context);
                    },
                  )),
              title:const Text("Select Member", style: KTextStyle.appBar),
              backgroundColor: KColor.white,
              elevation: 0,
              centerTitle: true,
            ),
            body: Center(child:Text("No Users Found"),),
          );
        }
        else{
          return  Scaffold(
            appBar:AppBar(
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
              backgroundColor: KColor.white,
              elevation: 0,
              centerTitle: true,
            ),
            body: const Center(child:CircularProgressIndicator(),),
          );
        }

      },
    );
  }
}
