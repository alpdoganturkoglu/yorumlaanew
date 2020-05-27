import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/signin.dart';



Future<String> createComment(String commnetB,String cn1,String cn2,String c3,String cn4,String cn5,int r1,int r2,int r3,int r4,int r5,String slug) async{

  String urls = "localhost:3000/api/products/"+slug+"/create_comment";

  Map<String,dynamic> commentData={
    "body": commnetB,
    "ratings":[
      {
        "category_name":cn1,
        "rating_value":r1
      },
       {
        "category_name":cn1,
        "rating_value":r1
      },
       {
        "category_name":cn1,
        "rating_value":r1
      },
       {
        "category_name":cn1,
        "rating_value":r1
      }
    ]
  };
  var commentresponse = await http.post(urls,body: jsonEncode(commentData),headers: {"Authorization": jwt});
  if(commentresponse.statusCode ~/ 100 == 2){

      return null;

  }
  else{

      return jsonDecode(commentresponse.body);
  }


}