import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/Controller/signInControlle.dart';



Future<String> deleteUser(String password) async{
  var username = userData[0].username;
  var userId= userData[0].id.toString();
  String urls = "https://yorumlaa.herokuapp.com/api/users/"+userId;
  Map<String,dynamic> deleteuser = {
    "user": {
        "email_or_username":username,
        "password": password
    }
    
};
var response = await http.post("https://yorumlaa.herokuapp.com/api/login",body: jsonEncode(deleteuser),headers: {"Content-Type":"application/json"});
if(response.statusCode~/100 == 2){
  var responsetodelete = await http.delete(urls,headers: {"Content-Type":"application/json"});
  return null;
}
else{
  return response.body.toString();
}
}