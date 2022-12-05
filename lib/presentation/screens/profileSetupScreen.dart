import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';


import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../widgets/button.dart';
import '../widgets/textFeild.dart';


class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,TaskStates>(
      listener: (context,states){},
      builder:(context,states)=>
          Scaffold(
              backgroundColor: KColor.white,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: KColor.white,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                centerTitle: false,
                title: Padding(
                    padding: EdgeInsets.only(left: KSize.getWidth(context, 40.0)),
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
                elevation: 0,
              ),
              body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: KSize.getWidth(context, 12)),
                      Center(
                        child: Container(
                          height: KSize.getHeight(context, 80),
                          width: KSize.getWidth(context, 80),
                           decoration:AuthCubit.get(context).pikedImage==null?
                         const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColor.cultured5,
                          image:DecorationImage(
                            image:AssetImage(
                            "assets/png/Profile22.png",
                          ),
                          ),
                          )
                            :const BoxDecoration(
                              shape: BoxShape.circle,
                              color: KColor.cultured5),
                          child: AuthCubit.get(context).pikedImage==null?null
                              :CircleAvatar(
                             backgroundImage :FileImage(
                               AuthCubit.get(context).pikedImage!,
                              )),
                        ),
                      ),
                      SizedBox(height: KSize.getWidth(context, 10)),
                      Center(child: Builder(
                        builder: (context) {
                          return GestureDetector(
                              onTap: () {
                                _showDialog(context);
                              },
                              child: Text("Upload Image", style: KTextStyle.subtitle2.copyWith(fontSize: 10.0, color: KColor.ultramarineBlue)));
                        }
                      )),
                      SizedBox(height: KSize.getHeight(context, 50)),
                     KTextField(text: "First Name"),
                      SizedBox(height: KSize.getHeight(context, 30)),
                      KTextField(text: "Last Name"),
                      SizedBox(height: KSize.getHeight(context, 40)),
                      KButton(
                        title: "Continue",
                        onPressedCallback: () {
                        //   Navigator.of(context)
                        //       .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => KBottomNavigationBar()), (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  )),
      ),
    );
  }
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title:const Text("Select attachment source"),
            content: Row(
              children: [
                GestureDetector(
                  onTap: () {
                     AuthCubit.get(context).getImage();
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/png/camera.png", height: 30, width: 30,),
                ),
                SizedBox(
                  width: KSize.getWidth(context, 30),
                ),
                GestureDetector(
                    onTap: () {
                       AuthCubit.get(context).galleyImage();
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/png/gllery.png", height: 30, width: 30,)
                )
              ],
            ),

          );
        }
    );
  }

}
