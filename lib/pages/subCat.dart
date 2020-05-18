import 'package:flutter/material.dart';

class catCard{
  catCard(
  {this.icon,this.title}
      );
  IconData icon;
  String title;
}
class subCatList{
  subCatList(
  {this.img,this.title,this.sublist}
      );
  String img;
  String title;
  List sublist;
}

class subCat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_subCatState();
}

class _subCatState extends State<subCat>{
  List<subCatList> subCats=[
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:["Telefon"]),
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:[]),
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:[]),
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:[]),
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:[]),
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:[]),
    subCatList(img: "https://pluspng.com/img-png/laptop-hd-png-laptop-notebook-png-image-1358.png",title:"Bilgisayar",sublist:[] ),

  ];
  List<catCard> cats=[
    catCard(icon: Icons.phone_android,title: "Elektronik"),
    catCard(icon: Icons.phone_android,title: "Elektronik"),
    catCard(icon: Icons.phone_android,title: "Elektronik"),
    catCard(icon: Icons.phone_android,title: "Elektronik"),
    catCard(icon: Icons.phone_android,title: "Elektronik"),
  ];
  @override
  Widget build(BuildContext context) {
    bool subcatsub=false;
    return SafeArea(
      child: Scaffold(
        body: subcatsub == false ?CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("Yorumlaa",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              floating: true,
              pinned: false,
              snap: false,
              expandedHeight: MediaQuery.of(context).size.height/4.70,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height/3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    itemBuilder:(BuildContext context,int index){
                      final cat= cats[index];
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height:100,
                                    width:100,
                                    child: Card
                                      (
                                      elevation: 8,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(cat.icon),
                                          Text(cat.title),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
            SliverFixedExtentList(

              itemExtent: MediaQuery.of(context).size.height/9,
              delegate: SliverChildBuilderDelegate(


                    (BuildContext,int index){
                  final subCat=subCats[index];
                  return Material(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {

                              final category=subCat.sublist;
                              subcatsub=true;

                          });
                        },
                        child: Container(
                          key: Key(subCat.title),
                          margin: EdgeInsets.only(top: 15),
                          child: ListTile(
                            leading: Image.network(subCat.img),
                            title: Text(subCat.title),
                          ),
                        ),
                      )
                  );
                },
                childCount:subCats.length,
              ),
            )
          ],
        ) :
          ListView.builder(


              itemBuilder: (BuildContext context,int index){

          }
          )
      )
    );
  }
}