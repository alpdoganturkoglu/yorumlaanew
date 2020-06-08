import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/signin.dart';


Future <String> deleteComment(String slug) async{

String deleteComUrl ="https://yorumlaa.herokuapp.com/api/products/"+slug;

  var deleteresp = await http.delete(deleteComUrl,headers: {"Authorization": jwt});

  if(deleteresp.statusCode ~/ 100 == 2 ){
    debugPrint(deleteresp.body.toString());
    return null;
  }
  else{
    debugPrint(deleteComUrl);
    debugPrint(jwt);
    debugPrint(deleteresp.statusCode.toString());
    return deleteresp.body.toString();
  }

}