import 'package:flutter/material.dart';
import 'package:yorumlaa/pages/searchPage.dart';
import 'package:yorumlaa/Controller/searchController.dart';


class floatingButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Color.fromRGBO(32, 191, 85, 1),
      onPressed: (){
        titlesearch.clear();
        categorysearched.clear();
        slugsearch.clear();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>searhPage()));
      },
      child: Icon(Icons.search),
    );
  }
}