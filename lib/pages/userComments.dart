import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yorumlaa/Controller/usComShowCont.dart';
import 'package:yorumlaa/pages/productPage.dart';



class userComments extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => uCState();
}

class uCState extends State<userComments>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Yorumlaa",
              style: TextStyle(
                color: Color.fromRGBO(1, 186, 239, 1),
              ),
            ),
            centerTitle: true,
           
          ),
        body: uComBody.isEmpty == false ? ListView.builder(

                   
                    shrinkWrap: true,
                    itemCount: uComBody.length,
                    itemBuilder: (BuildContext context,int index){
                

                    
                      return Container(

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
                                              leading: Text((uRating[index].toString().substring(0,3))+"  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ratingcolor(uRating[index])),),
                                              animation: true,
                                              percent: 0.8,
                                              progressColor: ratingcolor(uRating[index]),
                                            )
                                          ],
                                        )
                                    ),


                                    Row(

                                      children: <Widget>[
                                        Container(
                                        margin: EdgeInsets.only(left:2 ),
                                        child:Text(
                                             uComT.elementAt(index)[0].substring(0,10).replaceAll("-", "/")
                                        ),
                                        ),
                                        Container(

                                          child: PopupMenuButton(
                                            onSelected: (result){
                                              
                                              
                                            },
                                              itemBuilder: (BuildContext context) => [
                                                
                                                    PopupMenuItem(
                                                      value: 0,
                                                      enabled: false,
                                                     child :Text(
                                                        "Şikayet Et"
                                                      ),
                                                      ),
                                                     PopupMenuItem(
                                                      enabled: false,
                                                      value: 1,
                                                     child :Text(
                                                        "Düzenle"
                                                      ),
                                                      ),
                                                      PopupMenuItem(
                                                      enabled: false,
                                                      value: 2,
                                                     child :Text(
                                                        "Sil"
                                                      ),
                                                      )
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
                                            uComBody[index],
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
                                                  uCom.elementAt(index)[1],
                                              textAlign: TextAlign.start,

                                            ),

                                          ),
                                          InkWell(

                                          
                                            child: Icon(
                                              Icons.thumb_up,
                                              size: 20,
                                              color:Colors.grey,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(left: 8,right: 10),
                                            child:  Text(
                                              uComLD.elementAt(index)[0],
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          InkWell(
                                           
                                            child: Icon(
                                              Icons.thumb_down,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8,right: 5),
                                            child:  Text(
                                             uComLD.elementAt(index)[1],
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
                      );
                    },
                  ):
                  Center(
                    child:Text("Hiç yorumunuz yok :(")
                  )
      ),
    );
  }
}