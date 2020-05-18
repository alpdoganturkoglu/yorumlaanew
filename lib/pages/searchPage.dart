import 'package:flutter/material.dart';

class searhPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _searchPageState();

}

class _searchPageState extends State<searhPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 70,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Column(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(top: 10),),
                Container(
                  height: 50,
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: null),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        )
                    )
                ),
              ),
              ]
            ),
          )
        ],
      ),
    );
  }
}