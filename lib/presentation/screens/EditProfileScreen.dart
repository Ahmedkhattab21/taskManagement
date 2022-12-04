import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/k_size.dart';
import '../../constant/my_colors.dart';
import '../widgets/KAppbar.dart';
import '../widgets/textFeild.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final picker = ImagePicker();

  Future getImage() async {

    final pickerImage = await picker.getImage(source: ImageSource.camera);
    setState(() {

    });
  }

  Future galleyImage() async {
    final pickerImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
    });
  }

  @override
  void initState() {
    nameController.text = 'Adom Shafi';
    emailController.text = 'hellobesnik@gmail.com';
    passwordController.text = '123456';

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColor.white,
      appBar: KAppbar(title: "Edit Profile"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile Picture
            SizedBox(height: KSize.getHeight(context, 46.0)),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    height: KSize.getHeight(context, 100.0),
                    width: KSize.getWidth(context, 100.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/png/pro1.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: KSize.getWidth(context, 14.0),
                    child: Container(
                      height: KSize.getHeight(context, 20.0),
                      width: KSize.getWidth(context, 20.0),
                      decoration: BoxDecoration(color: KColor.ultramarineBlue, shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () {
                          _showDialog(context);
                        },

                        child: Image.asset(
                          "assets/png/pencil.png",
                          height: KSize.getHeight(context, 5.89),
                          width: KSize.getWidth(context, 5.9),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 40.0)),

            Container(
              margin: EdgeInsets.only(left: 42.0, right: 38.0),
              child: Column(
                children: [
                  KTextField(controller: nameController, text: "YOUR NAME"),
                  SizedBox(
                    height: KSize.getHeight(context, 30.0),
                  ),
                  KTextField(controller: emailController, text: "YOUR EMAIL"),
                  SizedBox(
                    height: KSize.getHeight(context, 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: KTextField(
                      controller: passwordController,
                      text: "YOUR PASSWORD",
                      isPasswordField: true,
                    ),
                  ),
                  SizedBox(height: 2000,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Select attachment source"),
            content: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
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
                      galleyImage();
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
