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
            key:type=="mail"?AuthCubit.get(context).formKeyemail:
            type=="pass"?AuthCubit.get(context).formKeypass:
            type=="mailup"?AuthCubit.get(context).formKeyemailUp:
            type=="passup"?AuthCubit.get(context).formKeypassUp:
            type=="name"?
            AuthCubit.get(context).formKeyName:
            type=="phone"?
            AuthCubit.get(context).formKeyPhone:
            null,
            child: TextFormField(
              key: Key("mail"),
              keyboardType:type=="mail"?TextInputType.emailAddress :
              type=="pass"?TextInputType.visiblePassword:
              type=="mailup"?TextInputType.emailAddress :
              type=="passup"?TextInputType.visiblePassword:
              type=="name"?TextInputType.text:
              type=="phone"?TextInputType.phone:
              null,
              controller: controller,
              obscureText: isPasswordField ? AuthCubit.get(context).obscureText : false,
              onChanged: (value) {
                type=="mail"?
                AuthCubit.get(context).formKeyemail.currentState!.validate():
                type=="pass"?
                AuthCubit.get(context).formKeypass.currentState!.validate():
                type=="mailup"?
                AuthCubit.get(context).formKeyemailUp.currentState!.validate():
                type=="passup"?
                AuthCubit.get(context).formKeypassUp.currentState!.validate():
                type=="name"?
                AuthCubit.get(context).formKeyName.currentState!.validate():
                type=="phone"?
                AuthCubit.get(context).formKeyPhone.currentState!.validate()
                :null;
                if (isPasswordField) {
                  AuthCubit.get(context).isClearAbleFalse();
                }
                if (!isPasswordField) {
                  if(value.isEmpty){
                    AuthCubit.get(context).isClearAbleTrue();
                  }
                  else if(value.isNotEmpty){
                    AuthCubit.get(context).isClearAbleFalse();
                  }
                }


              },
              validator:type=='mail'?(val)=> AuthCubit.get(context).validateEmail(val):
                  type=="pass"?(val)=> AuthCubit.get(context).validatePassword(val):
                  type=='mailup'?(val)=> AuthCubit.get(context).validateEmail(val):
                  type=="passup"?(val)=> AuthCubit.get(context).validatePassword(val):
                  type=="name"? (val)=> AuthCubit.get(context).validateName(val):
                  type=="phone"? (val)=> AuthCubit.get(context).validatePhone(val):
                      null,
              decoration: InputDecoration(
                prefixText: type=="phone"?"+20":null,
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
                      : controller!.text.isNotEmpty
                      ? IconButton(
                      onPressed: () {
                        controller!.clear();
                        AuthCubit.get(context).isClearAbleTrue();
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
