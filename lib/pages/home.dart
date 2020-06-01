import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/categoryController.dart';
import 'package:yorumlaa/Controller/productContreller.dart';
import 'package:yorumlaa/Controller/searchbyCatCont.dart';
import 'package:yorumlaa/makeComment.dart';
import 'package:yorumlaa/pages/productList.dart';
import 'package:yorumlaa/pages/productPage.dart';
import 'file:///C:/Users/turko/AndroidStudioProjects/yorumlaa/lib/pages/followpage.dart';
import 'package:yorumlaa/pages/profilePage.dart';
import 'package:yorumlaa/pages/category.dart';
import 'package:yorumlaa/pages/mainPage.dart';
import 'package:yorumlaa/pages/testpage.dart';
import 'package:yorumlaa/signin.dart';
import '../floatingButton.dart';



class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentTab = 0;
  final List<Widget> pages = [
    mainPage(),
    category(),
    followPage(),
    profilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = mainPage();
  @override
    Widget build(BuildContext context) {
      return Scaffold(

        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButton(),
        bottomNavigationBar: BottomAppBar(
            color: Color.fromRGBO(1, 186, 239, 1),
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentPage = mainPage();
                        currentTab = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home,
                        color:Colors.white

                    ),
                      iconSize: currentTab == 0 ? 40: 24
                  ),
                  IconButton(
                    onPressed: () async{
                     
                      await categoryData();

                        setState(() {
                          currentPage =category();
                          currentTab = 1;
                        });
                      
                      
                    },
                    icon: Icon(Icons.apps, color:Colors.white),iconSize: currentTab == 1 ? 40: 24 ,
                  ),
                  Text(""),
                  IconButton(
                    onPressed: () {
                      if(jwt != null){
                        setState(() {
                        currentPage = followPage();
                        currentTab = 2;
                      });
                      }
                       else{
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> signin()));
                         }
                    },
                    icon: Icon(Icons.check_circle,color:Colors.white ),iconSize: currentTab == 2 ? 40: 24 ,
                  ),
                  IconButton(
                      onPressed: () {
                      
                         if(jwt != null){
                           setState(() {
                            currentPage = profilePage();
                            currentTab = 3;
                           });
                         }
                         else{
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> signin()));
                         }
                       
                      },
                      icon: Icon(Icons.account_circle, color:Colors.white),iconSize: currentTab == 3 ? 40: 24 ,)
                ],
              ),
            )),
      );
    }
  }

