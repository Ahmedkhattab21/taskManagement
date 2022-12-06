import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wtasks/constant/string.dart';

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
  

}