import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


List <List<catsdata>>catsdatatosent =[];

class catsdata{
  String title;
  bool agerest;
  String slug;
  String category;
  catsdata({this.title,this.agerest,this.slug,this.category});
  factory catsdata.fromJson(
    Map<String,dynamic> catstoParse){
      return catsdata(
        title: catstoParse['title'],
        agerest: catstoParse['age_restriction'],
        slug: catstoParse['slug'],
        category: catstoParse['category']
      );
    }
} 
void catstoParse(jsonbody){
  for (int i=0 ; i<jsonbody.length; i++){
    var parsed = catsdata.fromJson(jsonbody[i]);
    catsdatatosent.add([parsed]);
    debugPrint(catsdatatosent.toString());
  }
}

Future<String> categorySearch(String catName) async{

    Map<String,dynamic> categorySearchData= {
        "catergory": catName,
    };
  var catsResponse =await http.post(
    "https://yorumlaa.herokuapp.com/api/products/search_by_category",
    body: jsonEncode(categorySearchData),
    headers: {"Content-Type": "application/json"} 
  );
  if((catsResponse.statusCode~/100) == 2){
    catstoParse(jsonDecode(catsResponse.body));
  }
}