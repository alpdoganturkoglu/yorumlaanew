import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/changePasswordCont.dart';
import 'package:yorumlaa/pages/profileEdit.dart';


class changePassword extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>_changePasswordState();

}
TextEditingController _oldpas =TextEditingController();
TextEditingController _newpas =TextEditingController();
TextEditingController _contpas =TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>(); 


Widget formbuilder(String hint,TextEditingController control){

return TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: control,
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(
                       hintText:hint,
                       hintStyle: TextStyle(color:Color.fromRGBO(1, 186, 239, 1)),
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
                  );

}

class _changePasswordState extends State<changePassword>{

@override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        body:Container(
          color: Color.fromRGBO(0, 0, 0, 0.9),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              child:Column(
                children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child:Text("Şifrenizi Değiştirin",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),),
                 Container(
                   margin: EdgeInsets.all(8),
                   width: MediaQuery.of(context).size.width/1.25,
                   child: formbuilder("Eski Şifreniz", _oldpas)
                  ),

                  Container( 
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width/1.25,
                    child: formbuilder("Yeni Şifre", _newpas)
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width/1.25,
                    child:formbuilder("Yeni Şifre(Tekrar)", _contpas)
                    )
                ],
              ) 
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width/1.25,
              height: 50,
              child:OutlineButton(
              onPressed: ()async{
                var oldpas = _oldpas.text.trim();
                var newpas = _newpas.text.trim();
                var cont = _contpas.text.trim();
                var id = "2";
                var error = await changePasswordCont(oldpas, newpas, id);
                if(error == null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> profileEdit()));
                }
                else{
                 _scaffoldkey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(error,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                            duration: Duration(seconds: 3),
                            backgroundColor: Color.fromRGBO(32, 191, 85, 1),
                            elevation: 12,
                            ),);
                }
              },
              color: Colors.transparent,
              borderSide: BorderSide(color: Color.fromRGBO(32, 191, 85, 1),),
              child: Text("Şifremi Değiştir",style: TextStyle(color: Color.fromRGBO(32, 191, 85, 1)),),
            ) ,
              ),
          
          ],
        ) ,
        )
       ),
    );
    
  }

}