import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:yorumlaa/signin.dart';



Future commentLike(bool l_or_d,String comid) async{

  var likeData = jsonEncode(
    {
    "details": {
        "like": l_or_d
    }
    }
    );

 String detail_url ="https://yorumlaa.herokuapp.com/api/comments/"+comid;
 var likeresponse = await http.post(detail_url,body: likeData, headers: {"Authorization": jwt,"Content-Type": "application/json"});

  if (likeresponse.statusCode ~/100 == 2){
    debugPrint(likeresponse.body.toString());
    return null;
  }

  else {
    debugPrint(likeresponse.body.toString());
    return likeresponse.body.toString();
  }

}
Future commentLikePatch(bool l_or_d,String comid) async{
  var likeDataP =jsonEncode(
    {
    "details": {
        "like": l_or_d
    }
    }
    );
    debugPrint(likeDataP.toString());
 String detail_url ="https://yorumlaa.herokuapp.com/api/comments/"+comid;
 var likepatchresp = await http.patch(detail_url,body: likeDataP,headers: {"Authorization": jwt,"Content-Type": "application/json"});

if(likepatchresp.statusCode~/100 == 2){
  debugPrint(likepatchresp.body.toString());
  return null;
}
else{
  debugPrint(likepatchresp.statusCode.toString());
  return likepatchresp.statusCode;
}

}

Future deleteld(String comid) async{
  String deleteurl= "https://yorumlaa.herokuapp.com/api/comments/"+comid+"/comment_details";
  var deleteresp = await http.delete(deleteurl,headers: {"Authorization": jwt,"Content-Type": "application/json"} );
  
  if(deleteresp.statusCode~/100 == 2){
        debugPrint(deleteresp.statusCode.toString());

    return null;
  }
  else{
    debugPrint(deleteresp.statusCode.toString());
    return deleteresp.statusCode.toString();
  }

}