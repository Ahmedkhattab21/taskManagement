import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import '../widgets/KAppbar.dart';

final List<Map> selectMemberModel = [
  {'image': 'assets/png/Image1.png', 'title': 'Ahnaf Irfan', 'isSelect': false},
  {'image': 'assets/png/Tony.png', 'title': 'Tony Stark', 'isSelect': false},
  {'image': 'assets/png/img2.png', 'title': 'Banner', 'isSelect': false},
  {'image': 'assets/png/img21.png', 'title': 'David Smith', 'isSelect': false},
  {'image': 'assets/png/img41.png', 'title': 'Mike Jekson', 'isSelect': false},
  {'image': 'assets/png/captain.png', 'title': 'Captain Steve', 'isSelect': false},
  {'image': 'assets/png/sami.png', 'title': 'Sami Rafi', 'isSelect': false},
  {'image': 'assets/png/sami.png', 'title': 'Fahim Ahmed', 'isSelect': false},
];
class SelectMemberScreen extends StatefulWidget {
  @override
  _SelectMemberScreenState createState() => _SelectMemberScreenState();
}

class _SelectMemberScreenState extends State<SelectMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColor.white,
      appBar: KAppbar(title: "Select Member"),
      body: Container(
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
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      prefixIcon: Image.asset("assets/png/search.png"),
                      border: InputBorder.none,
                      hintText: "Search ",
                      hintStyle: TextStyle(color: Color(0xFF1E1E1E), fontSize: 14.0)),
                )),
            SizedBox(height: KSize.getHeight(context, 26)),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectMemberModel.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectMemberModel[index]['isSelect'] = !selectMemberModel[index]['isSelect'];
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(selectMemberModel[index]['image']),
                              ),
                              SizedBox(width: KSize.getWidth(context, 15)),
                              Text(
                                selectMemberModel[index]['title'],
                                style: KTextStyle.body1.copyWith(fontWeight: FontWeight.w600, height: 18 / 16),
                              ),
                            ],
                          ),
                          selectMemberModel[index]['isSelect'] == true
                              ? Container(
                            height: KSize.getHeight(context, 20),
                            width: KSize.getWidth(context, 20),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.ultramarineBlue),
                            child: Center(
                              child: Container(
                                height: KSize.getHeight(context, 8),
                                width: KSize.getWidth(context, 8),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.white),
                              ),
                            ),
                          )
                              : Container(
                            height: KSize.getHeight(context, 20),
                            width: KSize.getWidth(context, 20),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: KColor.cultured3),
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
        padding: MediaQuery.of(context).viewInsets,
      ),
    );
  }
}
