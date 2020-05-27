import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<String> signUp(String username,String email,String password) async{
  Map<String,dynamic> signUpData ={
    "user": {
      "email": email,
      "username":username,
      "password":password
      
    }
  };
  var response = await http.post(
    "https://yorumlaa.herokuapp.com/api/signup",
  body: jsonEncode(signUpData),
  headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode~/100 == 2){
    return null;
  }
  else{
    return response.body.toString();
  }
}

