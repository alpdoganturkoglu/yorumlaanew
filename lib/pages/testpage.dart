import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/productContreller.dart';
import 'package:yorumlaa/Controller/categoryController.dart';


class testPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _testPageState();
}
final GlobalKey<ScaffoldState> _scaffoldkeySUp = new GlobalKey<ScaffoldState>(); 

class _testPageState extends State<testPage>{
    
    @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: _scaffoldkeySUp,
        body: Center(
          child:Container(
            width: 1000,
            height: 1000,
             child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            RaisedButton(
              onPressed: ()async{
                 var productinf = await categoryData();
               
               _scaffoldkeySUp.currentState.showSnackBar(SnackBar(content: Text(subCategory.toString())));
              },
            )
          ],),
          )
          ),
        
      );
  }
}