import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<String> changePasswordCont(String oldPas,String newPas,String userId) async{
  String urls = "https://yorumlaa.herokuapp.com/api/users/"+userId;
  Map<String,dynamic> password = {
    "user": {
        "password": oldPas,
        "new_password": newPas,
    }
    
};
var response = await http.patch(urls,body: jsonEncode(password),headers: {"Content-Type":"application/json"});
if(response.statusCode~/100 == 2){
  return null;
}
else{
  return response.body.toString();
}
}