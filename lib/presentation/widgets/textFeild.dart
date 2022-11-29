import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';

class KTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final IconData? icon;
  final bool isPasswordField;
  final TextEditingController? controller;

  const KTextField(
      {Key? key,
        required this.text,
        required this.hintText,
        this.icon,
        this.isPasswordField = false,
        this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AuthCubit(),
      child: BlocConsumer<AuthCubit,TaskStates>(
        listener: (context,states){},
        builder: (context,states) =>Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: KTextStyle.subtitle2.copyWith(color: KColor.slateGray)
            ),
            TextField(
              controller: controller,
              obscureText: isPasswordField ? AuthCubit.get(context).obscureText : !AuthCubit.get(context).obscureText,
              onChanged: (value) {
                if (!isPasswordField) {
                  AuthCubit.get(context).isClearAbleTrue();
                }
                if(value.length == 0){
                  AuthCubit.get(context).isClearAbleFalse();
                }
              },
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:const TextStyle(fontFamily: 'Mulilsh'),
                  suffixIcon: isPasswordField
                      ? IconButton(
                    onPressed: () {
                      AuthCubit.get(context).password();
                    },
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      AuthCubit.get(context).obscureText  ? Icons.visibility : Icons.visibility_off,
                      size: 16.0,
                    ),
                  )
                      : AuthCubit.get(context).isClearAble
                      ? IconButton(
                      onPressed: () {
                        controller!.clear();
                        AuthCubit.get(context).isClearAbleFalse();
                      },
                      icon:const Icon(
                        Icons.cancel,
                        color: KColor.ultramarineBlue,
                        size: 16.0,
                      ))
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}
