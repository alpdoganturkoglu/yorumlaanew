import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/searchController.dart';
class searhPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _searchPageState();

}

TextEditingController _searchController= TextEditingController();
final GlobalKey<ScaffoldState> _searchKey =new GlobalKey<ScaffoldState>(); 
class _searchPageState extends State<searhPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _searchKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:Color.fromRGBO(1, 186, 239, 1),
            expandedHeight: 70,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Column(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(top: 10),),
                Container(
                  height: 50,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (text)async{
                        var message= await searchController(text.toString());
                        _searchKey.currentState.showSnackBar(
                        
                        SnackBar(content: Text(sDatatosent.toString()),)
                        );
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: (){
                          _searchController.clear();
                        }),
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