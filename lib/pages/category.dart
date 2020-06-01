import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/searchbyCatCont.dart';
import 'package:yorumlaa/pages/productList.dart';
import 'package:yorumlaa/Controller/categoryController.dart';
import 'package:yorumlaa/pages/subCategory.dart';


class category extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _categoryState();
}


class _categoryState extends State<category>{
 
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
          itemCount: mainCategory.length,
          itemBuilder:(context,index){
            return InkWell(
              onTap: () async {
                var toGo=subCategory[index];
                if(toGo != null){
                  toCome(toGo);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> subCat()));
                }
                else {
                  var check=await categorySearch(mainCategory.elementAt(index));
                  if(check == null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>productList()));
                  }
                  else{
                    return null;
                  }
                  
                }
              
              },
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/9,
                child: Card(
                  elevation: 12,
                  child: Row(children: [
                  Container(
                  margin: EdgeInsets.all(15),
                  child: Text(mainCategory.elementAt(index),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
              
                
              ],),
                )
              
              ,)
            );
            
          }
          ),
    
      ) 
    );
  }
}