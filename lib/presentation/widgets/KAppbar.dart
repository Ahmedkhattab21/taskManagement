import 'package:flutter/material.dart';

import '../../constant/k_size.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';

class KAppbar extends StatelessWidget implements PreferredSizeWidget {
  final assetPath;
  final title;
  final centerTitle;
  final bool hideBackButton;

  KAppbar({
    this.assetPath = "assets/png/Back2.png",
    this.title,
    this.centerTitle = true,
    this.hideBackButton = false,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hideBackButton
          ? null
          : Padding(
          padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
          child: GestureDetector(
            child: Image.asset(
              assetPath,
              height: KSize.getHeight(context, 30),
              width: KSize.getWidth(context, 30),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      title: Text(title, style: KTextStyle.appBar),
      backgroundColor: KColor.white,
      elevation: 0,
      centerTitle: centerTitle,
    );
  }

  @override
  final Size preferredSize;
}
