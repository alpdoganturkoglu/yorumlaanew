import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/signin.dart';




Future <String> followProduct(pId) async{

  String fUrl =  "https://yorumlaa.herokuapp.com/api/products/"+pId+"/follow";
  var followresp = await http.post(fUrl,headers: {"Authorization": jwt} );

  if (followresp.statusCode ~/ 100 == 2){
    debugPrint(followresp.body);
    return null;
  }
  else{
    return followresp.body;
  }
}