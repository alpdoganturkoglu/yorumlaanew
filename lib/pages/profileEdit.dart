import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/userDelete.dart';
import 'package:yorumlaa/pages/changePassword.dart';
import 'package:yorumlaa/pages/infoedit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:yorumlaa/pages/userDeletePage.dart';



class profileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
  bool isSwitched = false;
  bool isNot = true;
  File _profileImage;
  Future getImage() async {
    var profileImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = profileImage ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Ayarlar",
            style: TextStyle(
              color: Color.fromRGBO(1, 186, 239, 1),
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 12,
                child: Column(
                  children: <Widget>[
                   InkWell(
                     onTap:getImage,
                     child:  Row(
                       children: <Widget>[
                         Padding(
                           child: Icon(
                             Icons.insert_photo,
                             size: 30,
                           ),
                           padding: EdgeInsets.all(5),
                         ),
                         Text(
                           "Profil Fotoğrafı ekle",
                           style: TextStyle(fontSize: 20),
                         ),
                       ],
                     ),
                   ),
                    Divider(thickness: 2,),
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> infoEdit()));
                     },
                     child:  Row(
                       children: <Widget>[
                         Padding(
                           child: Icon(
                             Icons.account_box,
                             size: 30,
                           ),
                           padding: EdgeInsets.all(5),
                         ),
                         Text(
                           "Hesap Bilgilerini Güncelle",
                           style: TextStyle(fontSize: 20),
                         ),
                       ],
                     ),
                   ),
                    Divider(thickness: 2,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> changePassword()));
                      },
                      child: Row(
                      children: <Widget>[
                        Padding(
                          child: Icon(
                            Icons.lock_outline,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Text(
                          "Şifreni Değiştir",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                elevation: 12,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          child: Icon(
                            isSwitched == true?Icons.brightness_7:Icons.brightness_5,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Padding(padding: EdgeInsets.only(right: 150),child: Text(
                          "Koyu Tema",
                          style: TextStyle(fontSize: 20),
                        ),),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        )
                      ],
                    ),
                    Divider(thickness: 2,),
                    Row(
                      children: <Widget>[
                        Padding(
                          child: Icon(
                            isNot == true?Icons.notifications_active:Icons.notifications_off,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Padding(padding: EdgeInsets.only(right: 159),child: Text(
                          "Bildirimler",
                          style: TextStyle(fontSize: 20),
                        ),),
                        Switch(
                          value: isNot,
                          onChanged: (value) {
                            setState(() {
                              isNot = value;
                              print(isNot);
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height:70,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 12,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5),child:  Icon(Icons.library_books),),
                    Text(
                        "Kişisel Verilerin Korunması",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
             Container(
              height:70,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> userDeletePage()));
                    
                  }
                ,
                child: Card(
                elevation: 12,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5),child:  Icon(Icons.delete),),
                    Text(
                        "Hesabımı Sil",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              )
            )
          ],
        ),
      ),
    );
  }
}
