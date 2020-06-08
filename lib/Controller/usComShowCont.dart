import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:yorumlaa/signin.dart';



class userComment{
  int comid ;
  String body;
  int like;
  int dislike;
  int product_id;
  int user_id;
  String username;
  String created;
  String updated;
  userComment({this.comid,this.body,this.like,this.dislike,this.product_id,this.user_id,this.username,this.created,this.updated});
  factory userComment.fromJson(Map<String,dynamic>comdata){
    return userComment(
      comid: comdata['id'],
      body: comdata['body'],
      like: comdata['like'],
      dislike: comdata['dislike'],
      product_id: comdata['product_id'],
      user_id: comdata['user_id'],
      username: comdata['username'],
      created: comdata['created_at'],
      updated: comdata['updated_at']
    );
  }

}
List <String> uComBody=[];
List <List<String>> uComLD = [];
List <String> uComId =[];
List <List<String>> uComT=[];
List<List<String>> uCom =[];
List <String> uComPId =[];
List <num> uRating =[];

void comParse(commentJson){
  for (int i =0 ; i<commentJson.length; i++){
      var comj =commentJson[i];
      var com=userComment.fromJson(comj['comment']);
      debugPrint(comj['rating'].toString());
      num temp =comj['rating'];
      uRating.add(temp);
      uComBody.add(com.body);
      uComLD.add([com.like.toString(),com.dislike.toString()]);
      uComId.add(com.comid.toString());
      uComT.add([com.created,com.updated]);
      uCom.add([com.user_id.toString(),com.username]);
      uComPId.add(com.product_id.toString());


  }
}

Future<String> getUserComment (String userId) async{

  String usercomurl = "https://yorumlaa.herokuapp.com/api/users/"+ userId+"/comments";

  var usercomresp = await http.get(usercomurl);

  if(usercomresp.statusCode ~/ 100 == 2 ){
        uRating.clear();
        uComBody.clear();
        uComLD.clear();
        uComId.clear();
        uComT.clear();
        uCom.clear();
        uComPId.clear();
        var decoded=jsonDecode(usercomresp.body);
        comParse(decoded['comments']);
         
         return null;
  }
  else{
    return usercomresp.body.toString();
  }
}
