import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class loginData{

  String username;
  int id;
  loginData({this.id,this.username});
  factory loginData.fromJson(Map<String,dynamic> ldata){
    return loginData(
      id: ldata['id'],
      username: ldata['username']
    );
  }
}
String logupid;
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
    var temp = loginData.fromJson(jsonDecode(response.body));
    logupid=temp.id.toString();
    return null;
  }
  else{
    return response.body.toString();
  }
}

