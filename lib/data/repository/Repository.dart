import '../model/Login_model.dart';
import '../model/createProjectRes_model.dart';
import '../model/createTeam_model.dart';
import '../model/edit_profile.dart'as e ;
import '../model/profile_model.dart' as Profile;
import 'package:wtasks/data/model/createProjReqest_model.dart' as mm;

import '../model/projects_model.dart';
import '../model/users_model.dart'as u;
import '../web_services/web_services.dart';

class Repository{
  WebServices webServices;
  Repository(this.webServices);

  Future<LoginModel> login(String email ,String pass)async{
    try {
      Map<String,dynamic> user = await webServices.login(email, pass);
      return LoginModel.fromJson(user);
    }catch(e){
      throw "error in Login ";
    }
  }
  Future<LoginModel> googleLogin()async{
    try {
      Map<String,dynamic> user = await webServices.googleLogin();
      print(121212);
      print(LoginModel.fromJson(user));
      print(131313);
      return LoginModel.fromJson(user);
    }catch(e){
      throw "error in Login with google";
    }
  }

  Future register(String name ,String email ,String pass,String phone)async{
    try {
      Map<String,dynamic> user = await webServices.register(name, email, pass, phone);
      return user;
    }catch(e){
      throw "error in Login ";
    }
  }

  Future<List<ProjectData>> getAllProjects()async {
    try{
      Map<String,dynamic> projects=await webServices.getAllProjects();
      return ProjectsModel.fromJson(projects).data.projects;
    }catch(e){
      throw "error in getAllProjects";
    }
  }
  Future<Profile.Data> getProfile()async {
    try{
      Map<String,dynamic> projects=await webServices.getProfile();
      print(4444);
      print(Profile.ProfileModel.fromJson(projects).data);
      print(55555);
      return Profile.ProfileModel.fromJson(projects).data;
    }catch(e){
      throw "error in getProfile";
    }
  }
  Future<e.Data> editProfile(String email ,String name, String phone)async {
    try{
      Map<String,dynamic> myData=await webServices.editProfile(email, name, phone);
      return e.EditProfile.fromJson(myData).data;
    }catch(e){
      throw "error in EditProfile";
    }
  }
  Future<List<u.User>> getUsers()async{
    try{
      Map<String,dynamic> users=await webServices.getUsers();
      return  u.UsersModel.fromJson(users).data.users;
    }catch(e){
      throw "error in GetUsers";
    }
  }
  Future<CreateTeamModel> createTeam(String title, List members)async{
    try{
      Map<String,dynamic> teamAdded=await webServices.createTeam(title, members);
      return CreateTeamModel.fromJson(teamAdded);
    }catch(e){
      throw "error in create team";
    }
  }
  Future<createProjectRes_model> createProject(String title,String dueDate, String description,mm.Member members)async{
    try{
      Map<String,dynamic> projectCreated=await webServices.createProject(title,dueDate, description,members);
      return createProjectRes_model.fromJson(projectCreated);
    }catch(e){
      throw "error in create team";
    }
  }




}
