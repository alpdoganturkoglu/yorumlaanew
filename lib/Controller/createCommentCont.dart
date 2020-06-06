import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/signin.dart';




Future createComment(String commnetB,String cn1,String cn2,String cn3,String cn4,String cn5,int r1,int r2,int r3,int r4,int r5,String slug) async{

  String urls = "https://yorumlaa.herokuapp.com/api/products/"+slug+"/create_comment";
  
  var commentData=jsonEncode(
    {
    "body": commnetB,
    "ratings":[
      {
    "category_name":cn1,
    "rating_value":r1,
    },
    {
    "category_name":cn2 ,
    "rating_value":r2 ,
  },
  {
    "category_name":cn3 ,
    "rating_value":r3 ,
  },
  {
    "category_name":cn4,
    "rating_value":r4,
  },
  {
    "category_name":cn5 ,
    "rating_value":r5 ,
  }
    ] 
  }
  );
  debugPrint(commentData.toString());
  var commentresponse = await http.post(urls,body: commentData,headers: {"Authorization": jwt,"Content-Type": "application/json"});
  if(commentresponse.statusCode ~/ 100 == 2){

      return null;

  }
  else{
      
      
      return jsonDecode(commentresponse.body);
  }


}