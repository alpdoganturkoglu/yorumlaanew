import 'package:flutter/material.dart';
import 'package:yorumlaa/pages/productPage.dart';
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
            return GestureDetector(
              onTap: (){
               var toGo=subCategory[index];
                if(toGo != null){
                  toCome(toGo);
                }
                else{
                  //mainCategory[index]
                  return null;
                }
              Navigator.push(context, MaterialPageRoute(builder: (context)=> subCat()));
              },
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/8,
                child: 
              Row(children: [
                Text(mainCategory.elementAt(index))
              ],)
              ,)
            );
            
          }
          ),
    
      ) 
    );
  }
}