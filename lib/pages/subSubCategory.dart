import 'package:flutter/material.dart';




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
        body:ListView.builder(
          itemCount: toShowsub.length,
          itemBuilder: (context,index){
            return GestureDetector(
              child:Container(
                  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/8,
                child:Row(children: [
                  Text(toShowsub.elementAt(index))
                ],)
              )
            );
          }
          )
      ),

    );
  }

}