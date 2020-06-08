import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../signin.dart';



Future <String> reportComment(String reportBody,String comId) async{

  String reportUrl= "https://yorumlaa.herokuapp.com/api/comments/"+comId+"/report";
  var reportbody = jsonEncode(
    {
      "report_body": reportBody
    }
  );
 var reportresponse = await http.post(reportUrl,body:reportbody,headers: {"Authorization": jwt,"Content-Type": "application/json"} );

 if (reportresponse.statusCode ~/ 100 == 2 ){
   debugPrint(reportresponse.body.toString());
   return null;
 }
 else{
   debugPrint(reportUrl);
      debugPrint(reportresponse.body.toString());
   debugPrint(reportresponse.statusCode.toString());

   return reportresponse.body.toString();
 }

}