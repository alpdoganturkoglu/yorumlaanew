import 'package:flutter/material.dart';
import 'file:///C:/Users/turko/AndroidStudioProjects/yorumlaa/lib/pages/followpage.dart';

class appBar extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _appBarState();
}
  Widget nbuilder()=>PopupMenuButton(
    itemBuilder: (BuildContext context) {}

      );

class _appBarState extends State<appBar>{

  GlobalKey btnKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 50,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "Yorumlaa",
        style: TextStyle(
        color: Color.fromRGBO(1, 186, 239, 1),
        ),
      ),
        actions: <Widget>[
          IconButton(
            key: btnKey,
            onPressed: (){
              nbuilder();
            },
            icon: Icon(
              Icons.notifications_none,
              color: Color.fromRGBO(1, 186, 239, 1),

            ),
          )
        ],
    );
  }

}