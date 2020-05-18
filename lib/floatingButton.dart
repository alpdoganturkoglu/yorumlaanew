import 'package:flutter/material.dart';


class floatingButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Color.fromRGBO(32, 191, 85, 1),
      onPressed: (){
        Navigator.pushNamed(context, "/searchpage");
      },
      child: Icon(Icons.search),
    );
  }
}