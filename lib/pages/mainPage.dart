
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yorumlaa/signin.dart';
class mainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _mainPageState();
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
class nproduct{
  nproduct({this.nimage,this.name,this.rating,this.brand,this.lowest,this.highest});
  String nimage;
  String name;
  String brand;
  double rating;
  String lowest;
  String highest;
}
List<nproduct> nproducts =[
  nproduct(nimage: "https://www.gizmozones.com/wp-content/uploads/2020/01/Samsung-S20.png",name: "Galaxy S20",brand: "Samsung",rating: 9.4,lowest: "8.000",highest: "10.000"),
  nproduct(nimage: "https://www.gizmozones.com/wp-content/uploads/2020/01/Samsung-S20.png",name: "Galaxy S20",brand: "Samsung",rating: 9.4,lowest: "8.000",highest: "10.000"),
  nproduct(nimage: "https://www.gizmozones.com/wp-content/uploads/2020/01/Samsung-S20.png",name: "Galaxy S20",brand: "Samsung",rating: 9.4,lowest: "8.000",highest: "10.000"),
  nproduct(nimage: "https://www.gizmozones.com/wp-content/uploads/2020/01/Samsung-S20.png",name: "Galaxy S20",brand: "Samsung",rating: 9.4,lowest: "8.000",highest: "10.000"),
  nproduct(nimage: "https://www.gizmozones.com/wp-content/uploads/2020/01/Samsung-S20.png",name: "Galaxy S20",brand: "Samsung",rating: 9.4,lowest: "8.000",highest: "10.000"),

];
List<String> imgList = [
  'https://images.hepsiburada.net/banners/s/0/672-378/bannerImage2113_20200422084528.png/format:webp',
  'https://images.hepsiburada.net/banners/s/0/672-378/bannerImage2113_20200422084528.png/format:webp',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
List <comment> comments=[
  comment(user: "şahink",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"1k" ,dislike: "13",rating: 1),
  comment(user: "crazyboy",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"152" ,dislike: "10",rating: 6),
  comment(user: "ebü ebü",commentw: "ÜRÜN ÇOK Güzel",time: "21/02/2020",like:"3" ,dislike: "1",rating: 8),
  comment(user: "fıtıfıtı",commentw: "Haftasonu sipariş, Salı teslimat. Açıyorsunuz, karşınıza ucuz kalitesiz birşey çıkacak zannediyorsunuz. Ama efsane sağlam malzemeli, ayarlanabilir ayaklı güzel bir tahta çıkıyor. Sapasağlam malzemeler, sağlam kargolama. Gerçekten mükemmel, çok şaşırdım, bu kadarını beklemiyordum. HARİKA ÜRÜN.",time: "21/02/2020",like:"1000" ,dislike: "100",rating: 10),
  comment(user: "mustafayılıbık",commentw: "Ham petrol fiyatlarının enflasyona olan etkisi vardır. Petrol fiyatlarındaki artış benzin fiyatlarını artırır, benzin fiyatlarının da ulaştırma aracılığıyla en sonunda enflasyona direk yansır. Buradaki nedensellik etkisi enflasyon arttıkça değerli metallerin de artmasından kaynaklanıyor ve petrol fiyatları enflasyon aracılığıyla değerli metallerin fiyatlarını da artırıyor. Petrol fiyatlarının tüketici fiyatlarına etkisi ve daha sonra bunun değerli metallere olan etkisi biraz gecikmeli olarak gerçekleşiyor"
      ,time: "21/02/2020",like:"1K" ,dislike: "2K",rating: 4),
  comment(user: "damat",commentw: "ÜRÜN ÇOK çokomelli",time: "21/02/2020",like:"1" ,dislike: "1k",rating: 9),
];
final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();

class _mainPageState extends State<mainPage>{

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
            actions: <Widget>[
              IconButton(
                icon:Icon(
                  Icons.add,
                  color: Color.fromRGBO(1, 186, 239, 1),
                )
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Color.fromRGBO(1, 186, 239, 1),
                ),
              )
            ],
          ),
        body: ListView(
          children: <Widget>[
            CarouselSlider(

                  items: imgList.map((item) => SizedBox(height:MediaQuery.of(context).size.height/3.5,child:Image.network(item,fit: BoxFit.fill,width: MediaQuery.of(context).size.width,),)).toList(),
                  options:
                  CarouselOptions(
                    height: MediaQuery.of(context).size.height/3,
                    aspectRatio: 16/9,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                  ),
                ),
            Padding(padding: EdgeInsets.all(10),child: Text("En Beğenilen Yorumlar",style: TextStyle(color: Colors.black,fontSize: 20),),),
            Divider(thickness: 1.5,),
            Container(
             height: MediaQuery.of(context).size.height/5,
             width: MediaQuery.of(context).size.width,
             child:  ListView.builder(
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemCount: comments.length,
               itemBuilder: (BuildContext context,int index){
                 final comment= comments[index];
                 return Container(
                   width: MediaQuery.of(context).size.width/1.041,
                   child: Card(
                     elevation: 20,
                     child:Column(

                       children: <Widget>[
                         Container(


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
                               Flexible(
                                 child: Container(

                                   margin: EdgeInsets.all(15),
                                   child:    Text(
                                       comment.commentw,
                                       overflow: TextOverflow.ellipsis,

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
           ),
            Padding(padding: EdgeInsets.all(10),child: Text("Yeni Eklenenler",style: TextStyle(color: Colors.black,fontSize: 20),),),
            Divider(thickness: 1.5,),
            GridView.count(
                    childAspectRatio: 0.8,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(4, (index){
                      final product = nproducts[index];
                      return GestureDetector(
                        child:Column(
                          children: <Widget>[

                            Padding(padding: EdgeInsets.only(top: 5),child: Text(product.brand+" "+product.name,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width:145,
                              height: 145,
                              decoration:BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              child:SizedBox(width: 100,height: 100,child:  Image.network(product.nimage,fit: BoxFit.scaleDown,)),

                            ),
                            Padding(padding: EdgeInsets.all(5),child: Text(product.lowest+" - "+product.highest,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),),
                            Container(

                              width: 150,
                              child:   LinearPercentIndicator(
                                lineHeight: 15.0,
                                center: Text("9.0",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                animation: true,
                                percent: 0.9,
                                progressColor: Colors.green,
                              ),
                            )

                          ],
                        ),
                      );
                    })

                  ),








          ],
        ),
      )
    );
  }

}