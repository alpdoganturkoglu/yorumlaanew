import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';



List <String>tempCat=[];
List <String> mainCategory =[];

List <List<String>> subCategory= [];
List <List<String>> subSubCategory= [];
List<List<String>> lastCategory=[];


class categoryParse{
  int id ;
  String name;
  String created;
  String updated;
  String ancestry;
  List children;
  categoryParse({this.id,this.name,this.created,this.updated,this.ancestry,this.children});
  factory categoryParse.fromJson(Map<String,dynamic> categoryDatato)  {
    
    return  categoryParse(
      id:categoryDatato['id'] as int,
      name: categoryDatato['name'] as String,
      created: categoryDatato['created_at'] as String,
      updated: categoryDatato['updated_at']as String,
      ancestry: categoryDatato['ancestry']as String,
      children: categoryDatato['children'] as List
    );
  }


}
void parentPars(jsonbody){
  for( var i = 0; i<jsonbody.length; i++){
     var parsed= categoryParse.fromJson(jsonbody[i]);
     mainCategory.add(parsed.name);
     if(parsed.children.isNotEmpty == true ){
       List <String>tempCat=[];
       for( var j = 0; j<parsed.children.length; j++){
        
        var subcat = categoryParse.fromJson(parsed.children[j]);
        tempCat.add(subcat.name);
        if(subcat.children.isNotEmpty == true ){
            List <String>tempSubCat=[];
            for( var j = 0; j<subcat.children.length; j++){
        
              var subSubcat = categoryParse.fromJson(subcat.children[j]);
              tempSubCat.add(subSubcat.name);
        
              }
              debugPrint(tempSubCat.toString());
              subSubCategory.add(tempSubCat);
       
             }
           else{
        
            subSubCategory.add(null);
            }
       }
        
        subCategory.add(tempCat);
       
      }
      else{
        
        subCategory.add(null);
      }
  }
  
}


Future categoryData()async{
  mainCategory.clear();
  subCategory.clear();
  subSubCategory.clear();
  var response =await http.post("https://yorumlaa.herokuapp.com/api/categories/tree",headers: {"Content-Type": "application/json"});
  if(response.statusCode~/100 == 2 ){
    var dBody =jsonDecode(response.body);
    parentPars(dBody);
    return response.body;
  }
  else{   
      debugPrint(response.statusCode.toString());
     return response.body;
  }

}


