import 'package:flutter/material.dart';


class verify extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _verifyState();
}


class _verifyState extends State<verify>{

@override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,


        ),
        body:Center(
          child: Column(
            children: [
              Container(child: Column(children: [
                Text("Email onayı gerekli"),
                Text("email adresine bir onay kodu gönderildi kaydı tamamlamak için lütfen onay kodunu girin")
              ],),),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                textAlign: TextAlign.center,
                
              ),
          ],),
        ) ,
        ) ,
      );

  } 

}