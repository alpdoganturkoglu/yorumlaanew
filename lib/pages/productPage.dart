import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yorumlaa/Controller/followController.dart';
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
class comment{
  comment(
  {this.user,this.time,this.commentw,this.like,this.dislike,this.rating}
      );
  String like;
  String dislike;
  String user;
  String time;
  String commentw;
  int rating;
}

class _productPageState extends State<productPage>{
  Future<void> _getData() async {
    comments.add(comment(user: "şahink",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"1k" ,dislike: "13",rating: 1),);

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
  List <comment> comments=[
    comment(user: "şahink",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"1k" ,dislike: "13",rating: 1),
    comment(user: "crazyboy",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"152" ,dislike: "10",rating: 6),
    comment(user: "ebü ebü",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"3" ,dislike: "1",rating: 8),
    comment(user: "fıtıfıtı",commentw: "Haftasonu sipariş, Salı teslimat. Açıyorsunuz, karşınıza ucuz kalitesiz birşey çıkacak zannediyorsunuz. Ama efsane sağlam malzemeli, ayarlanabilir ayaklı güzel bir tahta çıkıyor. Sapasağlam malzemeler, sağlam kargolama. Gerçekten mükemmel, çok şaşırdım, bu kadarını beklemiyordum. HARİKA ÜRÜN.",time: "21/02/2020",like:"1000" ,dislike: "100",rating: 10),
    comment(user: "mustafayılıbık",commentw: "Ham petrol fiyatlarının enflasyona olan etkisi vardır. Petrol fiyatlarındaki artış benzin fiyatlarını artırır, benzin fiyatlarının da ulaştırma aracılığıyla en sonunda enflasyona direk yansır. Buradaki nedensellik etkisi enflasyon arttıkça değerli metallerin de artmasından kaynaklanıyor ve petrol fiyatları enflasyon aracılığıyla değerli metallerin fiyatlarını da artırıyor. Petrol fiyatlarının tüketici fiyatlarına etkisi ve daha sonra bunun değerli metallere olan etkisi biraz gecikmeli olarak gerçekleşiyor"
    ,time: "21/02/2020",like:"1K" ,dislike: "2K",rating: 4),
    comment(user: "damat",commentw: "ÜRÜN ÇOK çokomelli",time: "21/02/2020",like:"1" ,dislike: "1k",rating: 9),
  ];
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
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10),
                          children: <Widget>[

                            new CircularPercentIndicator(
                              footer: Text(
                                "Genel",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              radius:65,
                              lineWidth: 7.0,
                              animation: true,
                              percent: 1,
                              center: new RichText(text: TextSpan(text: "8",style:TextStyle(color:Colors.black,fontSize: 13,) ,children: <TextSpan>[TextSpan(text: "/10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15))]),),
                              progressColor: Colors.green,
                            ),
                            Padding(padding: EdgeInsets.only(left: 50),),
                            new CircularPercentIndicator(
                              radius:65,
                              lineWidth: 7.0,
                              footer: Text(
                                "Performans",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              animation: true,
                              percent: 0.8,
                              center: new RichText(text: TextSpan(text: "8",style:TextStyle(color:Colors.black,fontSize: 13,) ,children: <TextSpan>[TextSpan(text: "/10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15))]),),
                              progressColor: Colors.green,
                            ),
                            Padding(padding: EdgeInsets.only(left: 50),),
                            new CircularPercentIndicator(
                              radius:65,
                              lineWidth: 7.0,
                              footer: Text(
                                "Kamera",
                                style: TextStyle(fontWeight: FontWeight.bold),

                              ),
                              animation: true,
                              percent: 0.9,
                              center: new RichText(text: TextSpan(text: "9",style:TextStyle(color:Colors.black,fontSize: 13,) ,children: <TextSpan>[TextSpan(text: "/10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15))]),),
                              progressColor: Colors.green,
                            ),
                            Padding(padding: EdgeInsets.only(left: 50),),
                            new CircularPercentIndicator(
                              radius:65,
                              lineWidth: 7.0,
                              animation: true,
                              footer: Text(
                                "Ekran",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              percent: 0.9,
                              center: new RichText(text: TextSpan(text: "9",style:TextStyle(color:Colors.black,fontSize: 13,) ,children: <TextSpan>[TextSpan(text: "/10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15))]),),
                              progressColor: Colors.green,
                            ),
                            Padding(padding: EdgeInsets.only(left: 50),),
                            new CircularPercentIndicator(
                              radius:65,
                              lineWidth: 7.0,
                              footer: Text(
                                "Batarya",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              animation: true,
                              percent: 0.6,
                              center: new RichText(text: TextSpan(text: "6",style:TextStyle(color:Colors.black,fontSize: 13,) ,children: <TextSpan>[TextSpan(text: "/10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15))]),),
                              progressColor: Colors.green,
                            ),

                          ],
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
                      color:isF?Colors.white:Color.fromRGBO(32, 191, 85, 1),
                      onPressed: () async {
                        if (jwt !=null){
                          var check = followProduct(prdctInf[1]);
                          if (check == null){
                            setState(() {
                              isF = true;
                            });
                          }
                        }
                        else {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> signin()));
                        }
                      },
                      elevation: 12 ,
                      child:Text("Takip Et",style: TextStyle(color: isF?Color.fromRGBO(32, 191, 85, 1):Colors.white)
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
                    itemCount: comments.length,
                    itemBuilder: (BuildContext context,int index){
                      final comment= comments[index];
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
                                              leading: Text("4.2"+"  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ratingcolor(comment.rating)),),
                                              animation: true,
                                              percent: comment.rating/10,
                                              progressColor: ratingcolor(comment.rating),
                                            )
                                          ],
                                        )
                                    ),


                                    Row(

                                      children: <Widget>[
                                        Text(
                                            comment.time
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
                                            comment.commentw,
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
                                                  comment.user,
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
                                              comment.like,
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
                                              comment.dislike,
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
              onRefresh: _getData
          )

      );
   
  }
}