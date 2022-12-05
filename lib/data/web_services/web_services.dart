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
  

}