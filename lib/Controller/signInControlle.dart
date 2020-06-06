import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


List<user> userData=[];

class user {
  String jwt;
  int id;
  String username;
  bool verf;
  user({this.jwt,this.id,this.username,this.verf});
  factory user.fromJson(
    Map<String,dynamic> ldata){
    return user(
    jwt:ldata['jwt'] as String,
    id:ldata['id'] as int ,
    username:ldata['username'] as String,
    verf:ldata['verification'] as bool,
    );
    
  }
}

void getData( int id,String username,bool verf){
 
    userData.add(user(id: id,username: username, verf: verf));
 }

Future <String>signIn(String email,String password) async{
  userData.clear();
  Map<String,dynamic> data = {
    "user": {
        "email_or_username": email,
        "password": password,
    }
  };

  var response = await http.post("https://yorumlaa.herokuapp.com/api/login",body: jsonEncode(data), headers: {"Content-Type": "application/json"},);
  
  if((response.statusCode~/100) == 2){
    var parsed=user.fromJson(json.decode(response.body));
    debugPrint(data.toString());
    getData(parsed.id, parsed.username, parsed.verf);
    return parsed.jwt;
  }

  else{
    return null;
  }
}