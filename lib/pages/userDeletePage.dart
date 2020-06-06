import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/userDelete.dart';
import 'package:yorumlaa/pages/mainPage.dart';


class userDeletePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _userDeletePageState();


}
 

class _userDeletePageState extends State<userDeletePage>{
  TextEditingController _passwordtoDelete = TextEditingController();
  TextEditingController _emailtoDelete = TextEditingController();
  TextEditingController _usernametoDelete = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Center(
                       
                        child:
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                         
                        child:
                        Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Container(
                             margin: EdgeInsets.all(10),
                             width: MediaQuery.of(context).size.width/1.3,
                            child: Text
                            (
                            "Üzgünüz..",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color.fromRGBO(1, 186, 239, 1),fontWeight: FontWeight.bold,fontSize: 50),
                            ),),
                          Container(
                             width: MediaQuery.of(context).size.width/1.3,
                            child: Text
                            (
                            "Bu işlemi onaylamak hesabınızın kalıcı olarak silinmesine sebep olacak.",
                            textAlign: TextAlign.center,
                            ),),
                          Container(
                          width: MediaQuery.of(context).size.width/1.3,
                            
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _passwordtoDelete,
                              style: TextStyle(fontSize: 12),
                              autofocus: true,
                              autocorrect: false,
                              autovalidate: true,
                              maxLines: 1,
                              obscureText: true,
                              decoration: InputDecoration(
                              hintText: "Şifreniz",
                              hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),
                              enabledBorder:OutlineInputBorder(
                                
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))

                               ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                               )
                           ),
                          ),),
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _emailtoDelete,
                              style: TextStyle(fontSize: 12),
                              autofocus: true,
                              autocorrect: false,
                              autovalidate: true,
                              maxLines: 1,
                              decoration: InputDecoration(
                              hintText: "Email",
                             hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),

                              enabledBorder:OutlineInputBorder(
                                
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))

                               ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                               )
                           ),
                          ),),
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _usernametoDelete,
                              style: TextStyle(fontSize: 12),
                              autofocus: true,
                              autocorrect: false,
                              autovalidate: true,
                              maxLines: 1,
                              
                              decoration: InputDecoration(
                             hintStyle: TextStyle(color: Color.fromRGBO(1, 186, 239, 1)),

                              hintText: "Kullanıcı adınız",
                              enabledBorder:OutlineInputBorder(
                                
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))

                               ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1))
                               )
                           ),
                          ),),
                          Container
                          
                          (
                            margin: EdgeInsets.all(10),
                             width: MediaQuery.of(context).size.width/1.4,
                            
                            height: 50,
                            child: 
                          FlatButton( 
                            shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                            color: Color.fromRGBO(32, 191, 85, 1),
                            textColor: Colors.white,
                            onPressed: ()async{
                            var password= _passwordtoDelete.text.trim();
                            var username = _usernametoDelete.text.trim();
                            var email = _emailtoDelete.text.trim();
                            var check=await deleteUser(password,username,email);
                            if(check == null){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>mainPage()));
                            }
                           }, child: Text("Hesabımı Sil")),)
                         ] ),)
                      ),
      ),
      );
  }
}