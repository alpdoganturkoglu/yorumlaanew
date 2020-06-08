import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/signin.dart';



List<String> notpro =[];
List<String> notcount=[];
Future <String> getNotf()async{


  if (jwt != null){
    var responsenotf = await http.get("https://yorumlaa.herokuapp.com/api/notifications",headers: {"Content-Type": "application/json","Authorization": jwt});
    if(responsenotf.statusCode ~/ 100 == 2){
      notpro.clear();
      notcount.clear();
      var resbody = jsonDecode(responsenotf.body);
      for(var key in resbody.keys){
        notpro.add(key);
        notcount.add(resbody[key].toString());
         debugPrint(notpro.toString());
      debugPrint(responsenotf.statusCode.toString());
      }
    }
    else{
      debugPrint(responsenotf.body.toString());
      debugPrint(responsenotf.statusCode.toString());
    }
  }
}