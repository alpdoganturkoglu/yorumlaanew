import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yorumlaa/Controller/cLDcontroller.dart';
import 'package:yorumlaa/Controller/followController.dart';
import 'package:yorumlaa/Controller/signInControlle.dart';
import 'package:yorumlaa/makeComment.dart';
import 'package:yorumlaa/signin.dart';
import 'package:yorumlaa/Controller/productContreller.dart';



var showPinf= prdctInf[0];
class productPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _productPageState();
}
Color ratingcolor(rating){
  if (rating>=7){
    return Colors.green;
  }
  else if(7>rating && rating>=5){
    return Colors.yellow;
  }
  else{
    return Colors.red;
    }
}

class _productPageState extends State<productPage>{


  Future<void> _getData() async {
    getProduct(slugtoref);

  }
  Color colorld(String liked){
    if(liked == "liked"){
      return Colors.green;
    }
    else if(liked == "disliked"){
      return Colors.red;
    }
    else{
      return Colors.grey;
    }
  }
  PageController pageController;
  List<String> images =[
    "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-11-pro-space-select-2019_GEO_EMEA?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1567808552932",
    "https://pngimg.com/uploads/iphone_11/iphone_11_PNG44.png"
  ];
  imageSlider(int index){
    return AnimatedBuilder(
      animation:pageController ,
      builder: (context,widget){
        return Center(
          child: widget,
          );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.network(images[index],fit: BoxFit.cover,),
      ),
    );
  }
  @override
  void initState(){
    super.initState();
    pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }
  
  bool isF = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButton:FloatingActionButton(
          elevation: 0,
          backgroundColor: Color.fromRGBO(32, 191, 85, 1),
          onPressed: (){
                   if(jwt != null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> makeComment()));
                   }
                    else{
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> signin()));
                         }
          },
          child: Icon(Icons.comment),
        ),

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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color.fromRGBO(1, 186, 239, 1),
              ),
            )
          ],
        ),
          body:RefreshIndicator(child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        prdctInf[0].toString(),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),//header
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){

                          },
                          child: SizedBox(
                            width: 300,
                            height: 300,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: images.length,
                              itemBuilder: (context,position){
                                return imageSlider(position);
                              },
                            ),
                          ),
                        )
                      ]
                  ),//product image
                  Container(
                    width: 200,
                    height: 120,
                    child: Card(
                        elevation: 20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10),
                          itemCount: prdctrating.length,
                          itemBuilder: (builder,index){
                            return Container(
                              width: MediaQuery.of(context).size.width/4,
                              child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              CircularPercentIndicator(
                              radius:65,
                              lineWidth: 7.0,
                              footer: Text(
                                rName[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              animation: true,
                              percent: prdctrating[index]/10,
                              center: new RichText(text: TextSpan(text: prdctrating[index].toInt().toString(),style:TextStyle(color:Colors.black,fontSize: 13,) ,children: <TextSpan>[TextSpan(text: "/10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15))]),),
                              progressColor: Colors.green,
                            )
                            ],) ,);
                          },
                        )
                    ),
                  ),//product rating
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/11,
                    color: Color.fromRGBO(32, 191, 85, 1),
                    margin: EdgeInsets.all(5),
                    child: ButtonTheme(
                      child: RaisedButton(
                      color:follow == true?Colors.white:Color.fromRGBO(32, 191, 85, 1),
                      onPressed: () async {
                        if (jwt !=null){
                          var check = followProduct(prdctInf[1]);
                          if (check == null){
                            setState(() {
                              follow= true;
                            });
                          }
                        }
                        else {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> signin()));
                        }
                      },
                      elevation: 12 ,
                      child:Text(follow == false?"Takip Et":"Takip Ediliyor",style: TextStyle(color: follow ?Color.fromRGBO(32, 191, 85, 1):Colors.white)
                      ),
                      ),
                    )
                  ),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      title: Text("Ürün Özellikleri"),
                      children: <Widget>[

                        Text(
                            "özeliik1"
                        ),  Text(
                            "özeliik1"
                        ),  Text(
                            "özeliik1"
                        ),
                        Text(
                            "özeliik1"
                        )
                      ],
                    ),
                  ),//product specs
                  Padding(padding:EdgeInsets.only(top:10) ,),
                  Text(
                    "Yorumlar",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),//comment header
                  ListView.builder(

                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: commentP.length,
                    itemBuilder: (BuildContext context,int index){
                      List<Color>likedC=[];
                      likedC.add(wld[index] == "liked"?colorld(wld[index]):Colors.grey);
                      Color dislikedC=wld[index] == "disliked"?colorld(wld[index]):Colors.grey;
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
                                              leading: Text((rating[index].toString().substring(0,3))+"  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ratingcolor(rating[index])),),
                                              animation: true,
                                              percent: rating[index]/10,
                                              progressColor: ratingcolor(rating[index]),
                                            )
                                          ],
                                        )
                                    ),


                                    Row(

                                      children: <Widget>[
                                        Container(
                                        margin: EdgeInsets.only(left:2 ),
                                        child:Text(
                                            comT.elementAt(index)[0].substring(0,10).replaceAll("-", "/")
                                        ),
                                        ),
                                        Container(

                                          child: PopupMenuButton(
                                              itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
                                                    PopupMenuItem<Widget>(
                                                    child:
                                                     InkWell(
                                                       onTap: (){
                                                         showDialog(context: context,
                                                        builder:(BuildContext context){
                                                          return AlertDialog(
                                                            title: Text("Şikayet Et"),
                                                            content: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Container(
                                                               child: Text(
                                                                 "Bu yorum sizi rahatsız mı etti?"
                                                               ),
                                                             ),
                                                             Container(
                                                               child: TextFormField(
                                                                 
                                                               ),
                                                             )
                                                            ],)
                                                            );
                                                        } 
                                                         );
                                                       },
                                                       child: Text(
                                                        "Şikayet Et"
                                                      ),)
                                                  ),
                                                   PopupMenuItem<Widget>(
                                                    child:
                                                     Text(
                                                         userData != null && userData.elementAt(0).id.toString() == commentUser.elementAt(index)[1].toString()? "Şikayet Et":
                                                         ""
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
                                            commentP[index],
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
                                                  commentUser.elementAt(index)[1],
                                              textAlign: TextAlign.start,

                                            ),

                                          ),
                                          InkWell(

                                            onTap: ()async{
                                              
                                            if (wld[index] ==null ){
                                              var check =await commentLike(true, comId[index]);
                                             if (check == null){
                                              setState(() {
                                                likedC == Colors.green;
                                              });
                                            }
                                            }
                                            else if(wld[index]== "disliked"){
                                              var check= await commentLikePatch(true, comId[index]);
                                              if(check==null){
                                                return null;
                                              }
                                              else{
                                                return null;
                                              }
                                            }
                                            else{
                                              await deleteld(comId[index]);
                                            }
                                            },
                                            child: Icon(
                                              Icons.thumb_up,
                                              size: 20,
                                              color:wld[index] == "liked"?colorld(wld[index]):Colors.grey,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(left: 8,right: 10),
                                            child:  Text(
                                              comDetails.elementAt(index)[0],
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async{
                                              if (wld[index] == null){
                                                var check = await commentLike(false, comId[index]);
                                                if(check == null){
                                                  setState(() {
                                                    dislikedC = Colors.red;
                                                  });
                                                }
                                              }
                                              else if(wld[index] == "liked"){
                                              var check= await commentLikePatch(false, comId[index]);
                                              if(check==null){
                                                return null;
                                              }
                                              else{
                                                return null;
                                              }
                                            }
                                              else{
                                              await deleteld(comId[index]);
                                            }
                                            },
                                            child: Icon(
                                              Icons.thumb_down,
                                              size: 20,
                                              color: wld[index] == "disliked"?colorld(wld[index]):Colors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8,right: 5),
                                            child:  Text(
                                              comDetails.elementAt(index)[1],
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
                  ),
                  Container(
                    height: 60,
                  )

                ],
              ),
            ],
          ),
              onRefresh:_getData
          )

      );
   
  }
}