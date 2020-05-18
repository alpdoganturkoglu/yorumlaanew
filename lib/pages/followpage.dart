import 'package:flutter/material.dart';


class followPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _followPageState();

}

class _followPageState extends State<followPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body:  Center(
        child: Text(
          "Hiçbir ürünü takip etmiyorsunuz",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
    );
  }
}