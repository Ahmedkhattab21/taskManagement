import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisiness_logic/cuibits/AuthCubit.dart';
import '../../buisiness_logic/task_states.dart';
import '../../constant/k_textStyle.dart';
import '../../constant/my_colors.dart';
import 'button.dart';

class KTextField extends StatelessWidget {


  final String? type;
  final String text;
  final String? hintText;
  final IconData? icon;
  final bool isPasswordField;
  final TextEditingController? controller;
   KTextField(
      {Key? key,
         this.type,
        required this.text,
         this.hintText,
        this.icon,
        this.isPasswordField = false,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: KTextStyle.subtitle2.copyWith(color: KColor.slateGray)
          ),
          Form(
            key:type=="mail"?AuthCubit.get(context).formKeyemail:AuthCubit.get(context).formKeypass,
            child: TextFormField(
              key: Key("mail"),
              keyboardType:type=="mail"?TextInputType.emailAddress :
              type=="pass"?TextInputType.visiblePassword:null,
              controller: controller,
              obscureText: isPasswordField ? AuthCubit.get(context).obscureText : !AuthCubit.get(context).obscureText,
              onChanged: (value) {
                type=="mail"?
                AuthCubit.get(context).formKeyemail.currentState!.validate():AuthCubit.get(context).formKeyemail.currentState!.validate();
                if (!isPasswordField) {
                  AuthCubit.get(context).isClearAbleTrue();
                }
                if(value.isEmpty){
                  AuthCubit.get(context).isClearAbleFalse();
                }

              },
              validator:type=='mail'?(val)=> AuthCubit.get(context).validateEmail(val):
                  type=="pass"?(val)=> AuthCubit.get(context).validatePassword(val):(val)=> AuthCubit.get(context).validateEmail(val),
              decoration: InputDecoration(
                  hintText: hintText==null? "" :hintText,
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
          ),
        ],
    );
  }
}
