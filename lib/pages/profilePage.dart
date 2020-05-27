import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorumlaa/pages/profileEdit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yorumlaa/Controller/signInControlle.dart';



class profilePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage>{


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height/3.5,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ Color.fromRGBO(32, 191, 85, 1),Color.fromRGBO(1, 186, 239, 1)]
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"),
                    radius: 50,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20),),
                  Text(
                    userData[0].username,
                    style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.edit,color: Colors.white,size: 30,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => profileEdit()));
                },
              )
            ],
          ),//appbar with picture
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(padding: EdgeInsets.only(top: 10),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/6,
                  child: Card(
                    elevation: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          height:MediaQuery.of(context).size.height/10 ,
                          width:MediaQuery.of(context).size.width/4,
                        ),
                        Container(
                          color: Colors.blue,
                          height:MediaQuery.of(context).size.height/10 ,
                          width:MediaQuery.of(context).size.width/4,
                        ),
                        Container(
                          color: Colors.blue,
                          width:MediaQuery.of(context).size.width/4,
                          height:MediaQuery.of(context).size.height/10 ,
                        ),
                      ],
                    ),
                  ),
                ),//info box
                Padding(padding: EdgeInsets.only(top: 10),),
                Row(
                  children: <Widget>[
                    Icon(Icons.comment),
                    Text("  En Beğenilen Yorumun",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                  ],
                ),
                //yorum
                Container(
                  child: Card(
                    elevation: 20,
                    child:Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child:   Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  width: MediaQuery.of(context).size.width/1.7,
                                  child: Row(
                                    children: <Widget>[
                                      LinearPercentIndicator(
                                        width: MediaQuery.of(context).size.width/2.1,
                                        lineHeight: 12,
                                        leading: Text("8"+"  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
                                        animation: true,
                                        percent:0.8,
                                        progressColor:Colors.green ,
                                      )
                                    ],
                                  )
                              ),


                              Row(

                                children: <Widget>[
                                  Text(
                                    "21/03/2020"
                                  ),
                                  Container(

                                    child: PopupMenuButton(
                                        itemBuilder: (_) => <PopupMenuItem<String>>[
                                          new PopupMenuItem<String>(
                                              child: const Text('Şikayet Et'), value: 'Doge'),
                                        ]
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),



                        Row(

                            children:<Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  child:    Text(
                                      "muhtemelen s10 ismiyle değil artık başka bir model adıyla piyasaya sürülecektir. 128 çekirdekli işlemcisi, 128 gb ram'iyle evrenin sırrını çözmenizi kolaylaştıracak ve dış uzaydan gelen mesajları anladığımız dile çevirecektir",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal)
                                  ),
                                ),
                              )
                            ]
                        ),

                        Container(
                          color: Colors.white12,
                          margin: EdgeInsets.only(bottom: 8),
                          width: MediaQuery.of(context).size.width,
                          child:  Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(

                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(

                                      width: MediaQuery.of(context).size.width/1.75,
                                      alignment:Alignment.bottomLeft,
                                      child: Text(
                                        "   "+
                                            "alpdogant",
                                        textAlign: TextAlign.start,

                                      ),

                                    ),
                                    GestureDetector(

                                      onTap: (){},
                                      child: Icon(
                                        Icons.thumb_up,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: 8,right: 10),
                                      child:  Text(
                                        "120",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){},
                                      child: Icon(
                                        Icons.thumb_down,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8,right: 5),
                                      child:  Text(
                                          "10",
                                          style: TextStyle(fontWeight: FontWeight.bold),

                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                Row(
                  children: <Widget>[
                    Icon(Icons.card_giftcard),
                    Text("  Rozetlerin",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  child: Card(
                    elevation:3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[

                          ],
                        ),
                        Row(
                          children: <Widget>[

                          ],
                        )
                      ],
                    ),

                  ),
                ),
                Container(width: MediaQuery.of(context).size.width,height: 50,)
              ]
            ),
          )
        ],
      )
    );
  }
}