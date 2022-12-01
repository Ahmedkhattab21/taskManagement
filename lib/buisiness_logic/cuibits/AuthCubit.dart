import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../task_states.dart';

class AuthCubit extends Cubit<TaskStates>{
  AuthCubit():super(InitialState());

  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();

  bool isClearAble = false;
  bool obscureText = true;


  TextEditingController emailControllerUp = TextEditingController();
  TextEditingController passControllerUp = TextEditingController();

  int count=1;
  counttt(){
    count++;
    emit(countplus());
  }

  ImagePicker picker = ImagePicker();
  File? pikedImage;

   getImage() async {

     XFile?  photo = await picker.pickImage(source: ImageSource.camera);
    if(photo ==null){
      return null;
    }
    pikedImage=File(photo.path!);
    emit(GetImageFromCameraState());
  }

   galleyImage() async {
     XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if(photo ==null){
      return null;
    }
    pikedImage=File(photo.path!);
    emit(GetImageFromGalaryState());
  }


  void isClearAbleTrue(){
    isClearAble=true;
    emit(OnClearAbleChangeToTrueState());
  }
  void isClearAbleFalse(){
    isClearAble= false ;
    emit(OnClearAbleChangeToFalseState());
  }

  void password() {
    obscureText = !obscureText;
    emit(OnPasswordChangeState());
  }

  static AuthCubit get(context)=>BlocProvider.of(context);

}