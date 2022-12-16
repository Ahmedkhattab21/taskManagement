import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wtasks/buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_textStyle.dart';
import '../../data/model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/k_size.dart';
import '../../constant/my_colors.dart';
import '../widgets/textFeild.dart';


class EditProfileScreen extends StatelessWidget {
  Data data;
  EditProfileScreen({required this.data});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states) {
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
          title: const Text("Edit Profile", style: KTextStyle.appBar),
          backgroundColor: KColor.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 46.0)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: KSize.getHeight(context, 100.0),
                  width: KSize.getWidth(context, 100.0),
                  child:const CircleAvatar(
                    backgroundImage: AssetImage("assets/png/pro1.png"),
                  ),
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 40.0)),

              Container(
                margin:const EdgeInsets.only(left: 42.0, right: 38.0),
                child: Column(
                  children: [
                    KTextField(
                      type: "name",
                      controller: AuthCubit.get(context).nameController, text: "YOUR NAME",),
                    SizedBox(
                      height: KSize.getHeight(context, 30.0),
                    ),
                    KTextField(
                      type: "mail",
                        controller: AuthCubit.get(context).emailController, text: "YOUR EMAIL"),
                    SizedBox(
                      height: KSize.getHeight(context, 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: KTextField(
                        type: "phone",
                        controller: AuthCubit.get(context).phoneController,
                        text: "YOUR Phone",
                      ),
                    ),
                   const SizedBox(height: 200,),
                  ],
                ),
              )
            ],
          ),
        ),
      );
      },
    );
  }
}
