import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



Future<String> signIn(String email,String password) async{
  Map<String,dynamic> data = {
    "user": {
        "email_or_username": email,
        "password": password,
    }
  };
  var response = await http.post("https://yorumlaa.herokuapp.com/api/login",body: jsonEncode(data), headers: {"Content-Type": "application/json"},);
  if((response.statusCode~/100) == 2){
    return response.body;
  }
  else{
    return response.statusCode.toString();
  }
}