import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../data/repository/Repository.dart';
import '../../presentation/screens/ProfileScreen.dart';
import '../../presentation/screens/home.dart';
import '../task_states.dart';

class AuthCubit extends Cubit<TaskStates>{
  Repository repository;
  AuthCubit(this.repository):super(InitialState());

  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();


  bool isClearAble = true;
  bool obscureText = true;


  TextEditingController emailControllerUp = TextEditingController();
  TextEditingController passControllerUp = TextEditingController();
  TextEditingController nameControllerUp = TextEditingController();
  TextEditingController phoneControllerUp = TextEditingController();



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

  //...Validate and Auth......
  final GlobalKey<FormState> formKeyemail = GlobalKey();
  final GlobalKey<FormState> formKeypass = GlobalKey();
  final GlobalKey<FormState> formKeyemailUp = GlobalKey();
  final GlobalKey<FormState> formKeypassUp = GlobalKey();
  final GlobalKey<FormState> formKeyName = GlobalKey();
  final GlobalKey<FormState> formKeyPhone = GlobalKey();




  validateEmail(val) {

    if (val!.isEmpty || !val.contains("@")) {
      return "Invalid email";
    }
    return null;
  }

  validatePassword(val) {
    if (val!.isEmpty || val.length < 8) {
      return "Passworf is too short";
    }
    return null;
  }
  validateName(val) {
    if (val!.isEmpty || val.length < 5) {
      return "name must greater than 5";
    }
    return null;
  }
  validatePhone(val) {
    int m=val.isEmpty?0:int.tryParse(val[0])??0;
    if (val!.isEmpty || val.length !=10 || m !=1 ) {
      return "Enter right number";
    }
    return null;
  }
  //....repositry.........
   login(){
    emit(OnLoadingState());
    repository.login(emailControllerLogin.text.toString(),passwordControllerLogin.text.toString()).
    then((value){
      emit(OnLoginSuccessState());
    }).catchError((catcError){
      emit(OnLoginErrorState(catcError.toString()));
    }

    );
  }
  register(){
    emit(OnLoadingState());
    repository.register(nameControllerUp.text.toString(),
        emailControllerUp.text.toString(),
        passControllerUp.text.toString(),
        ("+20"+phoneControllerUp.text).toString()).
    then((value){
      print(value);
      emit(OnRegisterSuccessState());
    }).catchError((catcError){
      print(catcError);
      emit(OnRegisterErrorState(catcError.toString()));
    }

    );
  }




  int currentIndex = 0;

  final List<Widget> bottomNavPages = [
    HomeScreen(),
    ProfileScreen(hideBackButton: true)
  ];

  setCurrentIndex(int navIndex){
    currentIndex = navIndex;
    if(currentIndex==0){

    }
    if(currentIndex==1){

    }

    emit(ChangeCurrentIndexState());
  }


  static AuthCubit get(context)=>BlocProvider.of(context);

}