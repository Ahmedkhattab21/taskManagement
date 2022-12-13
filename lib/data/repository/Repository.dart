import '../model/Login_model.dart';
import '../web_services/web_services.dart';

class Repository{
  WebServices webServices;
 late String taken;

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

}