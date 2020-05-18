import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class infoEdit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _infoEditState();
}

class _infoEditState extends State<infoEdit>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child:Scaffold(
        body: Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/1.3,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:
                    OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/1.3,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:
                    OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/1.3,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:
                    OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                    focusedBorder:
                    OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                  ),

                ),
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.all(10),
                   child:   ButtonTheme(
                     minWidth: MediaQuery.of(context).size.width/2.7,
                     height: 50,
                     child: RaisedButton(
                       onPressed: () {
                         Navigator.pop(context);
                       },
                       color: Colors.red,
                       textColor: Colors.white,
                       shape: RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(15.0),
                       ),
                       child: Text(
                         "İptal",
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.all(10),
                   child:   ButtonTheme(
                     minWidth: MediaQuery.of(context).size.width/2.7,
                     height: 50,
                     child: RaisedButton(
                       onPressed: () {
                         showDialog(
                           context: context,
                           builder: (BuildContext context){
                             return AlertDialog(
                               title: new Text("Bilgileri güncellemek için şifrenizi giriniz."),
                               content: new TextFormField(
                                 decoration: InputDecoration(
                                   hintText: "Parolanız",
                                   filled: true,
                                   fillColor: Colors.white,
                                   enabledBorder:
                                   OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.all(Radius.circular(12))),
                                   focusedBorder:
                                   OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.all(Radius.circular(12))),
                                 ),
                               ),
                               actions: <Widget>[
                                 FlatButton(
                                   child: Text("İptal"),
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                 ),
                                 FlatButton(
                                   child: Text("Onayla"),
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                 )
                               ],
                             );
                           }
                         );
                       },
                       color: Color.fromRGBO(32, 191, 85, 1),
                       textColor: Colors.white,
                       shape: RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(15.0),
                       ),
                       child: Text(
                         "Güncelle",
                         style: TextStyle(fontSize: 20),
                       ),
                     ),
                   ),
                 )
               ],
             )

            ],
          ),
        ),
      ) ,
    );
  }

}