import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:http/http.dart' as http;
import 'package:wtasks/constant/string.dart';
import 'package:wtasks/data/model/createProjReqest_model.dart'as cr;


class WebServices{
  Future login(String email ,String pass)async{
    String url =baseUrl+"/api/login";
    final response= await http.post(
        Uri.parse(url),
        headers:{
          "Content-Type":"application/json"
        },
      body: json.encode({
          "email":email,
          "password":pass
        }));
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in login";
    }
  }

  Future register(String name ,String email ,String pass,String phone)async{
    String url =baseUrl+"/api/register";
    final response= await http.post(
        Uri.parse(url),
        headers:{
          "Content-Type":"application/json"
        },
        body: json.encode({
          "name":name,
          "email":email,
          "password":pass,
          "phone":phone
        }));
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in Register";
    }
  }

  Future getAllProjects()async{
    final prefs = await SharedPreferences.getInstance();
    if( !prefs.containsKey('token')){
      throw "error in get token";
    }
    String? token= prefs.getString('token');
    String url =baseUrl+"/api/project";
    final response= await http.get(
        Uri.parse(url),
        headers:{
          "Content-Type":"application/json",
          "Authorization":"Bearer $token",
        },);
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in login";
    }
  }

  Future getProfile()async{
    final prefs = await SharedPreferences.getInstance();
    if( !prefs.containsKey('token')){
      throw "error in get token";
    }
    String? token= prefs.getString('token');
    String url =baseUrl+"/api/profile";
    final response= await http.get(
      Uri.parse(url),
      headers:{
        "Content-Type":"application/json",
        "Authorization":"Bearer $token",
      },);
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in getProfile";
    }

  }
  Future editProfile(String email ,String name, String phone)async {
    final prefs = await SharedPreferences.getInstance();
    if( !prefs.containsKey('token')){
      throw "error in get token";
    }
    String? token= prefs.getString('token');
    String url =baseUrl+"/api/profile/update";
    final response= await http.post(
        Uri.parse(url),
        headers:{
          "Content-Type":"application/json",
          "Authorization":"Bearer $token",
        },
        body: json.encode({
          "name":name,
          "email":email,
          "phone":phone
        }));
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in login";
    }
  }
  Future getUsers()async{
    final prefs = await SharedPreferences.getInstance();
    if( !prefs.containsKey('token')){
      throw "error in get token";
    }
    String? token= prefs.getString('token');
    String url =baseUrl+"/api/team/users";
    final response= await http.get(
      Uri.parse(url),
      headers:{
        "Content-Type":"application/json",
        "Authorization":"Bearer $token",
      },);
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in getUsers";
    }
  }

  Future createTeam(String title, List members)async{
    final prefs = await SharedPreferences.getInstance();
    if( !prefs.containsKey('token')){
      throw "error in get token";
    }
    String? token= prefs.getString('token');
    String url =baseUrl+"/api/team/add";
    final response= await http.post(
      Uri.parse(url),
      headers:{
        "Content-Type":"application/json",
        "Authorization":"Bearer $token",
      },
      body:  json.encode({
        "title":title,
        "members":members
      }));
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in create Team";
    }
  }
  Future createProject(String title,String dueDate, String description,cr.Member members)async{
    final prefs = await SharedPreferences.getInstance();
    if( !prefs.containsKey('token')){
      throw "error in get token";
    }
    String? token= prefs.getString('token');
    String url =baseUrl+"/api/project/add";
    final response= await http.post(
        Uri.parse(url),
        headers:{
          "Content-Type":"application/json",
          "Authorization":"Bearer $token",
        },
        body:  json.encode({
          "title": title,
          "dueDate": dueDate,
          "description": description,
          "member":members.toJson(),
        }));
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw "error in create Project";
    }
  }


}