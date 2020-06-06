import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/signUpController.dart';
import 'package:yorumlaa/Controller/verfController.dart';

import '../signin.dart';



class apPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _apPageState();
}

class _apPageState extends State<apPage>{
final TextEditingController _verfcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(margin: EdgeInsets.all(20), width: MediaQuery.of(context).size.width/1.2, child: Text("Hesabınızı onaylayın",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(1, 186, 239, 1)),)),
            Container(margin: EdgeInsets.all(20), width: MediaQuery.of(context).size.width/1.2, child: Text("Lütfen  gönderilen kodu buraya girip aktivasyonu tamamlayın",textAlign: TextAlign.center),),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: TextFormField(
                controller: _verfcode,
              style: TextStyle(color: Colors.black),
                     decoration: InputDecoration(
                       hintText: "Onay Kodu",
                       hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                     
                       enabledBorder:
                           OutlineInputBorder(
                               borderRadius:
                               BorderRadius.all(Radius.circular(12)),
                               
                              borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1)),
                               
                               ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                          ),
                     ),

            ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width/1.3,
              child:RaisedButton(
                onPressed: ()async{
                  
                  var check=await verfUser(_verfcode.text.trim(), logupid);
                  if(check== null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
                  }
                },
                 color: Color.fromRGBO(32, 191, 85, 1),
                  textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                child: Text("Onayla ve Bitir")
              ) ,
              )
          ],
        )
      ),
    ),);
  }
}