import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/searchbyCatCont.dart';
import 'package:yorumlaa/pages/productList.dart';




class subSubCat extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _subSubCatState();

}
List toShowsub;
void toComesub (List subCatl){
  toShowsub=subCatl;
}
class _subSubCatState extends State<subSubCat>{

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
        body:ListView.builder(
          itemCount: toShowsub.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: () async{
                 
                  var check=await categorySearch(toShowsub.elementAt(index));
                  if(check == null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>productList()));
                  }
                  else{
                    return null;
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
                  child: Text(toShowsub.elementAt(index),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
              
                
              ],),
                )
              
              ,)
            );
          }
          )
      ),

    );
  }

}