import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/Controller/signInControlle.dart';
import 'package:yorumlaa/signin.dart';



Future<String> deleteUser(String password,String username,String email) async{
  var username = userData[0].username;
  var userId= userData[0].id.toString();
  debugPrint(userId);
  String urls = "https://yorumlaa.herokuapp.com/api/users/"+userId;

  var requesdelete =  http.Request("DELETE",Uri.parse(urls));
  requesdelete.headers.addAll(<String,String>{
    "Authorization": jwt,
    "Content-Type": "application/json"
  });
  requesdelete.body =jsonEncode(
    {
    "user": {
        "email":email,
        "username": username,
        "password": password
    }
    }
  );
  var responsetodelete = await requesdelete.send();
if(responsetodelete.statusCode ~/ 100 == 2){
  debugPrint(responsetodelete.statusCode.toString());
  jwt = null;
  return null;
}
else{
  debugPrint(responsetodelete.statusCode.toString());
  return responsetodelete.statusCode.toString();
}
}