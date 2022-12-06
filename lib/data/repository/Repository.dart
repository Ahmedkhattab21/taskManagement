import '../web_services/web_services.dart';

class Repository{
  WebServices webServices;
 late String taken;

  Repository(this.webServices);
  Future login(String email ,String pass)async{
    try {
      Map<String,dynamic> user = await webServices.login(email, pass);
      taken = user['authorisation']['token'];
      print(taken);
      return user;
    }catch(e){
      throw "error in Login ";
    }
  }
  }