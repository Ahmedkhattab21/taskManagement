import '../model/Login_model.dart';
import '../model/profile_model.dart' as Profile;
import '../model/projects_model.dart';
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
      return Profile.ProfileModel.fromJson(projects).data;
    }catch(e){
      throw "error in getProfile";
    }
  }




}
