import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yorumlaa/Controller/productContreller.dart';
import 'package:yorumlaa/Controller/searchbyCatCont.dart';
import 'package:yorumlaa/pages/productPage.dart';


class productList extends StatefulWidget{

 @override
  State<StatefulWidget> createState() => _productListState();

}
Color ratingcolorl(num rating){
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

class _productListState extends State<productList>{

    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
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

          body: Container(
            child:  ListView(
              children: [
                 GridView.count(
                    childAspectRatio: 0.8,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(titletoshowl.length, (index){
                      String productT = titletoshowl[index];
                      String img = imgtoshowl[index];
                      return GestureDetector(
                       onTap: () async{
                         var check =await getProduct(pSlug[index]);
                         if(check == null){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>productPage()));
                         }
                       },
                         child:Column(
                          children: <Widget>[

                            Padding(padding: EdgeInsets.only(top: 5),child: Text(productT,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width:145,
                              height: 145,
                              decoration:BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              child:SizedBox(width: 100,height: 100,child:  Image.network(img,fit: BoxFit.scaleDown,)),

                            ),
                            Padding(padding: EdgeInsets.all(5),child: Text("8.000"+" - "+"10.000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),),
                            Container(

                              width: 150,
                              child:   LinearPercentIndicator(
                                lineHeight: 15.0,
                                center: Text(ratingtoshowl[index].toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                                animation: true,
                                percent: ratingtoshowl[index]/10,
                                progressColor: ratingcolor(ratingtoshowl[index]),
                              ),
                            )

                          ],
                        ),
                      );
                    })

                  ) ,
              ],
            )
            ),
        ) ,
      );
  }

}