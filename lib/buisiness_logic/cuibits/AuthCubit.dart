import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtasks/data/model/createProjReqest_model.dart' as mm;
import 'package:intl/intl.dart';


import '../../constant/string.dart';
import '../../data/repository/Repository.dart';
import '../../presentation/screens/ProfileScreen.dart';
import '../../presentation/screens/home.dart';
import '../../presentation/widgets/customOnBordering.dart';
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





  //
  // ImagePicker picker = ImagePicker();
  // File? pikedImage;
  //
  //  getImage() async {
  //
  //    XFile?  photo = await picker.pickImage(source: ImageSource.camera);
  //   if(photo ==null){
  //     return null;
  //   }
  //   pikedImage=File(photo.path!);
  //   emit(GetImageFromCameraState());
  // }

  //  galleyImage() async {
  //    XFile? photo = await picker.pickImage(source: ImageSource.gallery);
  //   if(photo ==null){
  //     return null;
  //   }
  //   pikedImage=File(photo.path!);
  //   // emit(GetImageFromGalaryState());
  // }

  int currentPage = 0;
  PageController controller = PageController();
  List<Widget> pages = [
    const CustomOnBoarding(title: "Task,\nCalendar,\nChat", image: "assets/png/Ai2.png"),
    const CustomOnBoarding(title: "Work With\nTeam\nAnytime", image: "assets/png/Ai3.png"),
  ];

  changingPage(index) {
    currentPage = index;
     emit(OnNotLoginState());
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
  //.... data .........
   login()async{
     isLogByGoogle=false;

     emit(OnLoadingState());
    repository.login(emailControllerLogin.text.toString(),passwordControllerLogin.text.toString()).
    then((value)async{
      final prefs = await SharedPreferences.getInstance();
       prefs.setString('token',value.authorisation.token);
      print( value.authorisation.token);
      emit(OnLoginSuccessState());
    }).catchError((catcError){
      emit(OnLoginErrorState(catcError.toString()));
    }

    );
  }
loggedByGoogle(){
  isLogByGoogle=true;
}
  googleLogin()async{
    isLogByGoogle=true;
    emit(OnLoadingState());
    print(1212);
    await repository.googleLogin().
    then((value)async{
      if(value == null ){
        emit(OnNotLoginState());
      }else{
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token',value.authorisation.token);
        print( value.authorisation.token);
        emit(OnLoginSuccessState());
      }

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
      emit(OnRegisterErrorState(catcError.toString()));
    }

    );
  }


//.....................home.............



  int currentIndex = 0;

  final List<Widget> bottomNavPages = [
    HomeScreen(),
    ProfileScreen(hideBackButton: true)
  ];
  currentIndexEqualZero()async{
    currentIndex=0;
    await getAllProjects();
  }
  currentIndexEqualEditZero()async{
    currentIndex=0;
    await editProfile();
    await getProfile();
  }
  currentIndexEqualOne()async{
    currentIndex=1;
    await editProfile();
    await getProfile();
  }


  setCurrentIndex(int navIndex)async{
    emit(OnHomeLoadingState());
    currentIndex = navIndex;
    if(currentIndex==0){
      await getAllProjects();
    }
    if(currentIndex==1){
      await getProfile();
    }
  }

///
  getAllProjects()async{
   await repository.getAllProjects().then((value)async {
      if(value.isEmpty){
        emit(OnEmptyProjectsState());
        return ;
      }
      emit(OnGetProjectsSuccessState(value));

    }).catchError((error){
      print(error);
      print("error");
      emit(OnGetProjectsErrorState(error));
    });

  }


//........profile.......

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  getProfile()async{
    await repository.getProfile().then((value) {
      emit(OnGetProfileState(value));
    }).catchError((error){
      emit(OnGetProfileErrorState(error));
    });

  }

  logout()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    emailControllerLogin.clear();
    passwordControllerLogin.clear();
    emit(LogOutState());


  }
  editProfile()async{
    emit(OnEditProfileLoadingState());
    await repository.editProfile(emailController.text.toString(),
         nameController.text.toString(),
         "+20"+phoneController.text.toString()).
     then((value)async{
       emit(OnEditProfileSuccessState());
     }).catchError((error){
       emit(OnEditProfileErrorState());
     });
  }
//............users.......

  TextEditingController teamNameController=TextEditingController();
  late List<Map> selectMemberModel =[];
     // {"index":0, 'isSelect': false},



  changeIconOnTap(index,id)async{
    selectMemberModel[index]['isSelect'] = !selectMemberModel[index]['isSelect'];
    selectMemberModel[index]['id'] = id;
    emit(ChangeIconIndexState());
    await getUsers();
  }

  getUsers()async{
    emit(OnGetUserLoadingState());
    await repository.getUsers().
    then((value)async{
      if(selectMemberModel.isEmpty||selectMemberModel.length != value.length){
        selectMemberModel=[];
        for(var i in value){
          selectMemberModel.add({"id":i.id,"isSelect":false,});
        }
        print(selectMemberModel);
      }else if(selectMemberModel.length == value.length){
      }


      emit(OnGetUsersSuccessState(value));
    }).catchError((error){
      emit(OnGetUsersErrorState(error));
    });
  }

//...........

  // List<String> dropDownItem = ['Anyone Can Join', 'B', 'C', 'D'];
  // String _selectedOption= "Anyone Can Join";

  createTeam()async{
    List elements=[];
    selectMemberModel.forEach((element) {
      if(element['isSelect']){
        elements.add(element['id']);
      }
    });
   await repository.createTeam(teamNameController.text, elements).then((value)async {
       // await currentIndexEqualZero();
     emit(OnCreateTeamSuccessState());
    } ).catchError((error){
      emit(OnCreateTeamErrorState());
    });
    await currentIndexEqualZero();

  }
  //..............
  TextEditingController projectNameController=TextEditingController();
  TextEditingController projectDescriptionController=TextEditingController();


  DateTime? endDate;
  //..............
  createProject()async{
    List<int> elements=[];
    selectMemberModel.forEach((element) {
      if(element['isSelect']){
        elements.add(element['id']);
      }
    });
    await repository.createProject(projectNameController.text,
      endDate==null?DateFormat.MMMMEEEEd().format(DateTime.now()) : DateFormat.MMMMEEEEd().format(endDate!),
        projectDescriptionController.text,mm.Member(users: elements,teams: [1])).
    then((value)async {
      // await currentIndexEqualZero();
      emit(OnCreateTeamSuccessState());
    } ).catchError((error){
      emit(OnCreateTeamErrorState());
    });
    await currentIndexEqualZero();

  }


  //...........




  changeDate(context)async{
    endDate= await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate:DateTime.now(),
    lastDate: DateTime(2101),
    );
    emit(OnChangeDateState());
  }





  static AuthCubit get(context)=>BlocProvider.of(context);

}