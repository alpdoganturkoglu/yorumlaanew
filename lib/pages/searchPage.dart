import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/productContreller.dart';
import 'package:yorumlaa/Controller/searchController.dart';
import 'package:yorumlaa/pages/productPage.dart';
class searhPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _searchPageState();

}


TextEditingController _searchController= TextEditingController();
final GlobalKey<ScaffoldState> _searchKey =new GlobalKey<ScaffoldState>(); 
class _searchPageState extends State<searhPage>{
  List <String> d1 = [];
  List <String> d2 = [];
   List <String> d3 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _searchKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:Color.fromRGBO(1, 186, 239, 1),
            expandedHeight: 80,
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
                        var check= await searchController(text.toString());
                        if (check == null){
                           setState(() {
                            d1 = titlesearch;
                            d2 = categorysearched;
                            d3 = slugsearch;
                         });
                        }
    
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
          ),
          SliverList(
            delegate:SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
              child:  
            titlesearch != null? ListView.builder(
                itemCount: d1.length,
                itemBuilder: (context,index){
                  
                  return Column(children: [
                    InkWell(
                      onTap: () async {
                       var check= await getProduct(d3[index]);
                         if(check == null){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>productPage()));
                         }
                      },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/9,
                      child:Row(children: [
                        d2[index] == "Telefon" || categorysearched[index] == "Akıllı Telefon"  ? Icon(Icons.phone_android,size: 25,):  null ,
                        Container(margin: EdgeInsets.all(10),child: Text(titlesearch[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                      ],) ,
                      ) ,
                  ),
                  Divider(thickness: 2,)
                  ],
                  );
                }
                )
                
            :
            Center(child: Text("Aradığınız ürün bulunamadı"),),)
            ]
            ) ,
            )
        ],
      ),
    );
  }
}