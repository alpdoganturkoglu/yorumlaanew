import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:yorumlaa/Controller/signUpController.dart';



class lands extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _landsState();
}
var _sUpFormState = GlobalKey<FormState>();
final TextEditingController _username = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _passwordCheck = TextEditingController();
final TextEditingController _birthday = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldkeySUp = new GlobalKey<ScaffoldState>(); 
bool _validate = false;
class _landsState extends State<lands>{
    bool terms=false;
  final format = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
  void onChanged(bool value){
   setState(() {
     terms=value;
   });
  }
    return Scaffold(
      key: _scaffoldkeySUp,
      body:Container(
        color:  Colors.white,
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child:Column(children: <Widget>[
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: <Widget>[
                        Text("Yorumlaa",style: TextStyle(color:Color.fromRGBO(1, 186, 239, 1),fontSize: 30,fontWeight: FontWeight.bold),)],),
                          ],
                          ),
                          ),
                  
                  Form(
                    key: _sUpFormState,
                    autovalidate: _validate,
                    child:Column(
                      children: [
                       Container(
                                        
                   margin: EdgeInsets.all(5),
                   width: MediaQuery.of(context).size.width/1.2,
                   child: TextFormField(
                     controller: _username,
                     validator: (name){
                                 Pattern pattern =
                                 r'^[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(name))
                                   return 'Geçersiz Kullanıcı adı';
                                    else
                                    return null;
                     },
                     style: TextStyle(color: Colors.black),
                     decoration: InputDecoration(
                       suffixIcon: IconButton(icon:Icon(Icons.help_outline,color: Color.fromRGBO(1, 186, 239, 1),),tooltip: "Kullanıcı adı şu karaterleri içeremez '.','!','-' ",),
                       hintText: "Kullanıcı Adı",
                       hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                     
                       enabledBorder:
                           OutlineInputBorder(
                               borderRadius:
                               BorderRadius.all(Radius.circular(12)),
                               
                              borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1)),
                               
                               ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                          ),
                     ),


                   ),
                 ),
                 
                  Container(
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width/1.2,
                    child: TextFormField(
                      controller: _email,
                      validator: (value){
                                       {
                             Pattern pattern =
                             r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                               RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                              return 'Geçersiz Email';
                              else if (value.isEmpty)
                              return 'Bu alan boş bırakılamaz';
                              else
                              return null;
                             }                        
                      },
                      style: TextStyle(color: Colors.black,),
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Colors.black),
                        
                        enabledBorder:
                        OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                      ),


                    ),
                  ),
                  
                  Container(
                    
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width/1.2,
                    child: TextFormField(
                      controller: _password,
                      validator: (value) => value.isEmpty?"Bu alan boş bırakılamaz":null,
                      style: TextStyle(color: Colors.black,),
                      decoration: InputDecoration(
                        
                        suffixIcon: IconButton(icon: Icon(Icons.warning,color: Color.fromRGBO(1, 186, 239, 1),),),
                        hintText: "Şifre",
                        hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                   
                        enabledBorder:
                        OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                      ),


                    ),
                  ),
                  
                  Container(
                     margin: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width/1.2,
                      child: TextFormField(
                        controller: _passwordCheck,
                        validator: (value) {
                          if( value != _password.text){
                            return 'Şifreniz uyuşmuyor';
                          }
                          else if (value.isEmpty){
                             return 'Bu alan boş bırakılamaz';
                          }
                          else{return null ;}
                         

                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                        hintText: "Şifre(Tekrar)",
                         hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                        enabledBorder:
                        OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                      ),


                    ),
                  ),
                 
                  Container(
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width/1.2,
                    child: DateTimeField(
                      validator: (value) => value == null ?"Bu alan boş bırakılamaz":null,
                      style: TextStyle(color: Colors.black,),
                      decoration:InputDecoration(
                        hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                        hintText: "Doğum Tarihi",
                       
                        enabledBorder:
                        OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                      ),
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return DatePicker.showDatePicker(
                          context,showTitleActions: true,minTime: DateTime(1,1,1930),maxTime: DateTime.now(),locale: LocaleType.tr,
                        );

                      },
                    ),
                  ),
                    ],)
                     ),
                  
                  Container(
                     margin: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.scale(scale: 1.5,child:  Checkbox(
                          activeColor:  Color.fromRGBO(32, 191, 85, 1),
                          value:terms,
                          onChanged: (bool value){
                            onChanged(value);
                          },
                        ),),

                       InkWell(
                         onTap: (){
                           showDialog(
                                context: context,
                                builder: (context){
                                    return AlertDialog(
                                      title: Text("Kullanıcı Sözleşmesi"),
                                      content:Text("Bla bla") ,
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: ()=>Navigator.of(context).pop(),
                                          child: Text("Tamam"),
                                        )
                                      ],
                                    );
                               }
                           );
                         },
                         child:Text(

                           "Kullanıcı Sözleşmesi",
                           style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),
                         ),
                       )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:10),),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width/1.8,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_sUpFormState.currentState.validate() && terms == true){
                          var username = _username.text.trim();
                          var email = _email.text.trim();
                          var password = _password.text.trim();
                          var birthday = _birthday.text.trim();
                          var isSignUp = await signUp(username, email, password);
                          if (isSignUp == null){
                            _scaffoldkeySUp.currentState.showSnackBar(SnackBar(
                              content: Text("Üyelik İşleminizi tamamlamak için e-posta..."),
                              )
                              );
                          }
                          else{
                            _scaffoldkeySUp.currentState.showSnackBar(SnackBar(
                              content: Text(isSignUp),
                              )
                              );
                          }
                        }
                        else{
                          setState(() {
                            
                           _validate = true;

                          });
                        }
                      },
                      color: Color.fromRGBO(32, 191, 85, 1),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Üyeliği Onayla",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),

                ],
              ),
          ),
        ),
      )
    );
  }
}