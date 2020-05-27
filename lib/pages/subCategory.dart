import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/categoryController.dart';
import 'package:yorumlaa/pages/subSubCategory.dart';





class subCat extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _subCatState();

}
List toShow;
void toCome (List subCatl){
  toShow=subCatl;
}
class _subCatState extends State<subCat>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body:ListView.builder(
          itemCount: toShow.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
               var toGo=subSubCategory[index];
                if(toGo != null){
                  toComesub(toGo);
                }
                else{
                  //mainCategory[index]
                  return null;
                }
              Navigator.push(context, MaterialPageRoute(builder: (context)=> subSubCat()));
              },
              child:Container(
                  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/8,
                child:Row(children: [
                  Text(toShow.elementAt(index))
                ],)
              )
            );
          }
          )
      ),

    );
  }

}