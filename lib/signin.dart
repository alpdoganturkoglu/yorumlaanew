import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorumlaa/lands.dart';
import 'dart:ui';
import 'package:yorumlaa/pages/home.dart';
import 'package:yorumlaa/Controller/signInControlle.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:progress_dialog/progress_dialog.dart';





final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>(); 
var jwt ;
var _formKey = GlobalKey<FormState>();
class signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _signInState();
}
final TextEditingController _usarnamemailController =TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool showpassword=true;
String hintText = "Kullanıcı Adı veya E-mail" ;
final storage = new FlutterSecureStorage();
class _signInState extends State<signin>{
  @override
  Widget build(BuildContext context) {
    final pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: false,showLogs: false);
    pr.style(
      message: "Lütfen Bekleyiniz",
      progressWidget: CircularProgressIndicator(),
      elevation: 12,
      insetAnimCurve: Curves.easeInOut,
    );
    return Scaffold(
      key: _scaffoldkey,
      body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                     margin: EdgeInsets.all(50),
                   child: Text("Yorumlaa",style: TextStyle(color: Color.fromRGBO(1, 186, 239, 1),fontWeight: FontWeight.bold,fontSize: 40),)
              
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    child: TextFormField(
                      validator: (value)=> value.isEmpty?"Bu alan boş bırakılamaz":null,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.black,),
                      controller: _usarnamemailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromRGBO(1, 186, 239, 1),
                        ),
                        hintText: hintText,
                        hintStyle: TextStyle(color:Color.fromRGBO(1, 186, 239, 1)),
                        
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1)),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    child: TextFormField(
                      validator: (value)=> value.isEmpty?" Şifre Boş bırakılamaz":null,
                      style: TextStyle(color: Colors.black),
                      maxLines: 1,
                      autocorrect: false,
                      controller: _passwordController,
                      obscureText: showpassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(1, 186, 239, 1)),
                        hintText: "Şifreniz",
                      
                        hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                        suffixIcon: IconButton(
                          icon:Icon(Icons.remove_red_eye,
                         color: Color.fromRGBO(1, 186, 239, 1),),
                          onPressed: (){
                            setState(() {
                              showpassword=!showpassword;
                            }
                            );
                          },
                        ),
                       
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Color.fromRGBO(1, 186, 239, 1))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1)
                            )
                            ),
                      ),
                    ),
                  ),
                      ],
                    ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  InkWell(
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(
                          color: Color.fromRGBO(1, 186, 239, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width/1.4,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                      if (_formKey.currentState.validate()){
                      pr.show();
                      var username= _usarnamemailController.text.trim();
                      var password= _passwordController.text.trim();
                      var jwttemp= await signIn(username,password);
                      
                      if (jwttemp != null){
                      setState(() {
                        
                        
                        jwt = jwttemp;
                        pr.hide();
                      });
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
                      }
                      else{
                        pr.hide();
                        _scaffoldkey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Şifre Ya da kullanıcı adı hatalı",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            duration: Duration(seconds: 3),
                            backgroundColor: Color.fromRGBO(32, 191, 85, 1),
                            elevation: 12,
                            ),);
                        setState(() {
                          
                          _passwordController.clear();
                          
                        });
                      }
                      }
                      },
                      color: Color.fromRGBO(32, 191, 85, 1),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> lands()));
                    },
                    child: Text(
                      "Üye Ol",
                      style: TextStyle(
                          color: Color.fromRGBO(1, 186, 239, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),

      ),
    );
  }
}