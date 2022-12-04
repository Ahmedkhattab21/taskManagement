import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';
import '../widgets/button.dart';

class CreateTeamScreen extends StatefulWidget {
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  List<String> dropDownItem = ['Anyone Can Join', 'B', 'C', 'D'];
  String _selectedOption= "Anyone Can Join";

  @override
  Widget build(BuildContext context) {
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
        title: Text("Create Team", style: KTextStyle.appBar),
        actions: [Container(margin: EdgeInsets.only(right: 24), child: SvgPicture.asset("assets/svg/menu.svg"))],
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
              SizedBox(height: KSize.getHeight(context, 46)),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: KSize.getHeight(context, 60.0),
                        width: KSize.getWidth(context, 60.0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.mediumSpringGreen),
                      ),
                      SizedBox(height: KSize.getHeight(context, 19.0)),
                      Container(
                        width: KSize.getWidth(context,150),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Team Name",
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  height: 20/18
                              )
                          ),
                        ),
                      )
                      /*
                      Text(
                        "Team Name",
                        style: KTextStyle.sectionTitle.copyWith(
                          color: KColor.eerieBlack.withOpacity(.20),
                          fontSize: 20,
                          height: 22 / 20,
                        ),
                      )*/
                    ],
                  )),
              SizedBox(height: KSize.getHeight(context, 38)),
              Text(
                "Add Team Member",
                style: KTextStyle.headline6.copyWith(
                  fontSize: 18,
                  height: 20 / 18,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 14.0)),
              GestureDetector(
                child: Container(
                  height: KSize.getHeight(context, 38.54),
                  width: KSize.getWidth(context, 38.54),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.ultramarineBlue),
                  child: Image.asset("assets/png/plus.png"),
                ),
                onTap: () {
                  Navigator.pushNamed(context,selectMemberScreen);
                },
              ),
              SizedBox(height: KSize.getHeight(context, 39.5)),
              Text(
                "Privacy",
                style: KTextStyle.headline6.copyWith(
                  fontSize: 18,
                  height: 20 / 18,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 15.0)),
              Container(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 18.0), right: KSize.getWidth(context, 20.55)),
                  height: KSize.getHeight(context, 46),
                  width: KSize.getWidth(context, 327),
                  decoration: BoxDecoration(color: KColor.cultured5, borderRadius: BorderRadius.circular(12.0)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _selectedOption,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue!;
                          });
                        },
                        items: dropDownItem.map((_value) {
                          return DropdownMenuItem(
                            child: new Text(_value),
                            value: _value,
                          );
                        }).toList(),
                        hint: Text('Select One', style: KTextStyle.button.copyWith(color: KColor.eerieBlack)),
                        icon: Image.asset(
                          "assets/png/arr44.png",
                        )),
                  )),
              SizedBox(height: KSize.getHeight(context, 50.0)),
              Center(
                child: KButton(
                  title: "Create Now",
                  buttonTextStyle: KTextStyle.button.copyWith(fontSize: 18, height: 20 / 18),
                  onPressedCallback: () {
                    // Navigator.of(context)
                    //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => KBottomNavigationBar()), (Route<dynamic> route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
