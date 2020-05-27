import 'package:flutter/material.dart';
import 'package:yorumlaa/pages/productPage.dart';



class mCategory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _mCategoryState();
}
List<String> categories =["Elektronik","Moda"];
List<List<String>> subCategories =[["Telefon","PC"],["AYAKKABI","SAAT"]];

class _mCategoryState extends State<mCategory>{
  static List<bool> activeCat= List.filled(categories.length, false); 
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
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder:(context,index){
            return Column(children: [
              GestureDetector(
              onTap: (){
                setState(() {
                  activeCat[index]=activeCat.elementAt(index)== true
                  ?false
                  :true;
                });
              },
              child:Row(children: [
                Text(categories.elementAt(index))
              ],)
            ),
            activeCat.elementAt(index)?
            ListView.builder(
              itemCount: subCategories.length,
              itemBuilder:(context,subIndex){
                return GestureDetector(
                  child:
                  Row(children: [
                    Text(
                      subCategories.elementAt(index).elementAt(subIndex),
                    )
                  ],)
                );
              } 
              ):
              Container(),
            ],
            );
          }
          ),
    
      ) 
    );
  }
}