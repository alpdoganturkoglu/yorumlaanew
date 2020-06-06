import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



Future<String> verfUser(String verfCode,String logId)async{
  String verfurl ="/api/users/"+logId+"/verify";
  Map <String,dynamic> verfData ={
      "verification": verfCode
  };
var verfResp = await http.post(verfurl,body: jsonEncode(verfData),headers: {"Content-Type": "application/json"});

if (verfResp.statusCode~/100 ==2){
  return null;
}
else {
  return verfResp.body.toString();
}
}


