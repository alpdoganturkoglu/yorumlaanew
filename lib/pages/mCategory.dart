import 'package:flutter/material.dart';
import 'package:yorumlaa/pages/productPage.dart';
import 'package:yorumlaa/pages/subCat.dart';
class mCategory extends StatelessWidget{
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
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
               GestureDetector(
                 onTap: (){
                   Navigator.push(context,  MaterialPageRoute(builder: (context) => subCat()),);
                 },
                 child:    SizedBox(
                   height: 160,
                   width: 160,
                   child: Card(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12)),
                     elevation: 20,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Icon(
                           Icons.phone_android,
                           size: 50,
                         ),
                         Padding(
                           padding: EdgeInsets.only(top: 10),
                         ),
                         Text("Elektronik")
                       ],
                     ),
                   ),
                 ),
               ),
               GestureDetector(
                 onTap: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) =>productPage()),);
                 },
                 child:    Container(

                   height: 160,
                   width: 160,
                   child: Card(

                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12)),
                     elevation: 20,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Icon(
                           Icons.local_mall,
                           size: 50,
                         ),
                         Padding(
                           padding: EdgeInsets.only(top: 10),
                         ),
                         Text("Moda")
                       ],
                     ),
                   ),
                 ),
               )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.directions_car,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Oto Aksesuar")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_florist,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Bahçe")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.build,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Yapı Market")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.toys,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Anne,Bebek,Oyuncak")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.directions_run,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Spor,Outdoor")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.brush,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Kişisel Bakım")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_grocery_store,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Süpermarket")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_library,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text("Kitap,Müzik,Film,Hobi",)
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          )),
    );
  }
}