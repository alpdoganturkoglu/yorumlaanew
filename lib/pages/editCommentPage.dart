import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/createCommentCont.dart';
import 'package:yorumlaa/Controller/editComCont.dart';
import 'package:yorumlaa/Controller/productContreller.dart';


class editCommentP extends StatefulWidget{
  const editCommentP({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _editCommentState();
}
 

  


class _editCommentState extends State<editCommentP>{
 

 var _formKey = GlobalKey<FormState>();
  double valueE;
  double value2E;
  double value3E;
  double value4E;
  double value5E;
  int cPageint= 0;
  TextEditingController editBody = TextEditingController();
  _editCommentState({this.valueE,this.value2E,this.value3E,this.value4E,this.value5E,this.editBody});
  PageController mcomment =PageController(initialPage: 0);
  cPage(){
    mcomment.addListener(() {
      setState(() {
      cPageint=mcomment.page.round();
    }); });
    return cPageint;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton:Stack(

       children: <Widget>[
         cPage() ==0?Stack(

           children: <Widget>[
             Align(
               alignment: Alignment.bottomRight,
               child: FloatingActionButton(
                 backgroundColor: Color.fromRGBO(32, 191, 85, 1),
                 onPressed: (){
                   mcomment.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                 },
                 child: Icon(Icons.arrow_forward),
               ),
             )
           ],
         ):
         Stack(
           children: <Widget>[
    
             Align(
               alignment: Alignment.bottomRight,
               child: FloatingActionButton(
                 backgroundColor: Color.fromRGBO(32, 191, 85, 1),
                 onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    var commentbodyto= editBody.text.trim();
                   var control =await editComment
                    (commentbodyto, rName[0], rName[1], rName[2], rName[3], rName[4],valueE.round(), value2E.round(), value3E.round(), value4E.round(), value5E.round(),slugtoref);
                    if(control == null){
                      Navigator.pop(context);
                    }                
                    else{
                     return null; 
                    }
                  }
                 },

                 child: Icon(
                   Icons.check
                 ),
               ),
             ),

           ],
         )
       ],
      ),
      body:Center(
        child:Container (

          child: PageView(
          controller: mcomment,
          children: <Widget>[
          Container (
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("Genel",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18
              ),),
              Text(valueE.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: LinearGradient(
                    colors: [ Color.fromRGBO(1, 186, 239, 1), Color.fromRGBO(32, 191, 85, 1)]
                  )
                ),
                 width: MediaQuery.of(context).size.width/1.2,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("1",textAlign: TextAlign.start,style: TextStyle(color: Colors.white),),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                          disabledActiveTrackColor: Colors.transparent,
                          activeTrackColor: Colors.transparent,
                          disabledInactiveTrackColor: Colors.transparent,
                          inactiveTrackColor: Colors.transparent,
                          activeTickMarkColor: Colors.white,
                          inactiveTickMarkColor: Colors.grey,
                          thumbColor: Colors.white,
                          thumbShape:RoundSliderThumbShape(
                            disabledThumbRadius: 10,
                            enabledThumbRadius: 10
                          )

                      ),
                      child:  Slider(
                        divisions: 9,
                        min: 1,
                        max: 10,
                        value: valueE,
                        onChanged: (value){
                          setState(() {
                            valueE=value;
                          });
                        },
                      ),
                    ),
                    Text("10",textAlign: TextAlign.end,style: TextStyle(color: Colors.white))
                  ],
                )
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Text("Performans",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18
              ),),
              Text(value2E.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                          colors: [ Color.fromRGBO(1, 186, 239, 1), Color.fromRGBO(32, 191, 85, 1)]
                      )
                  ),
                  width: MediaQuery.of(context).size.width/1.2,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("1",textAlign: TextAlign.start,style: TextStyle(color: Colors.white),),
                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                            disabledActiveTrackColor: Colors.transparent,
                            activeTrackColor: Colors.transparent,
                            disabledInactiveTrackColor: Colors.transparent,
                            inactiveTrackColor: Colors.transparent,
                            activeTickMarkColor: Colors.white,
                            inactiveTickMarkColor: Colors.grey,
                            thumbColor: Colors.white,
                            thumbShape:RoundSliderThumbShape(
                                disabledThumbRadius: 10,
                                enabledThumbRadius: 10
                            )

                        ),
                        child:  Slider(
                          divisions: 9,
                          min: 1,
                          max: 10,
                          value: value2E,
                          onChanged: (value){
                            setState(() {
                              value2E=value;
                            });
                          },
                        ),
                      ),
                      Text("10",textAlign: TextAlign.end,style: TextStyle(color: Colors.white))
                    ],
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Text("Kamera",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18
              ),),
              Text(value3E.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                          colors: [ Color.fromRGBO(1, 186, 239, 1), Color.fromRGBO(32, 191, 85, 1)]
                      )
                  ),
                   width: MediaQuery.of(context).size.width/1.2,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("1",textAlign: TextAlign.start,style: TextStyle(color: Colors.white),),
                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                            disabledActiveTrackColor: Colors.transparent,
                            activeTrackColor: Colors.transparent,
                            disabledInactiveTrackColor: Colors.transparent,
                            inactiveTrackColor: Colors.transparent,
                            activeTickMarkColor: Colors.white,
                            inactiveTickMarkColor: Colors.grey,
                            thumbColor: Colors.white,
                            thumbShape:RoundSliderThumbShape(
                                disabledThumbRadius: 10,
                                enabledThumbRadius: 10
                            )

                        ),
                        child:  Slider(
                          divisions: 9,
                          min: 1,
                          max: 10,
                          value: value3E,
                          onChanged: (value){
                            setState(() {
                              value3E=value;
                            });
                          },
                        ),
                      ),
                      Text("10",textAlign: TextAlign.end,style: TextStyle(color: Colors.white))
                    ],
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Text("Ekran",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18
              ),),
              Text(value4E.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                          colors: [ Color.fromRGBO(1, 186, 239, 1), Color.fromRGBO(32, 191, 85, 1)]
                      )
                  ),
                  width: MediaQuery.of(context).size.width/1.2,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("1",textAlign: TextAlign.start,style: TextStyle(color: Colors.white),),
                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                            disabledActiveTrackColor: Colors.transparent,
                            activeTrackColor: Colors.transparent,
                            disabledInactiveTrackColor: Colors.transparent,
                            inactiveTrackColor: Colors.transparent,
                            activeTickMarkColor: Colors.white,
                            inactiveTickMarkColor: Colors.grey,
                            thumbColor: Colors.white,
                            thumbShape:RoundSliderThumbShape(
                                disabledThumbRadius: 10,
                                enabledThumbRadius: 10
                            )

                        ),
                        child:  Slider(

                          divisions: 9,
                          min: 1,
                          max: 10,
                          value: value4E,
                          onChanged: (value){
                            setState(() {
                              value4E=value;
                            });
                          },
                        ),
                      ),
                      Text("10",textAlign: TextAlign.end,style: TextStyle(color: Colors.white))
                    ],
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Text("Batarya",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18
              ),),
              Text(value5E.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                          colors: [ Color.fromRGBO(1, 186, 239, 1), Color.fromRGBO(32, 191, 85, 1)]
                      )
                  ),
                   width: MediaQuery.of(context).size.width/1.2,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("1",textAlign: TextAlign.start,style: TextStyle(color: Colors.white),),
                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                            disabledActiveTrackColor: Colors.transparent,
                            activeTrackColor: Colors.transparent,
                            disabledInactiveTrackColor: Colors.transparent,
                            inactiveTrackColor: Colors.transparent,
                            activeTickMarkColor: Colors.white,
                            inactiveTickMarkColor: Colors.grey,
                            thumbColor: Colors.white,
                            thumbShape:RoundSliderThumbShape(
                                disabledThumbRadius: 10,
                                enabledThumbRadius: 10
                            )

                        ),
                        child:  Slider(
                          divisions: 9,
                          min:1,
                          max: 10,
                          value: value5E,
                          onChanged: (value){
                            setState(() {
                              value5E=value;
                            });
                          },
                        ),
                      ),
                      Text("10",textAlign: TextAlign.end,style: TextStyle(color: Colors.white))
                    ],
                  )
              ),

            ],
          ),
        ),
         Container(
            width: MediaQuery.of(context).size.width,
          
              child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                      Container(

                          width: MediaQuery.of(context).size.width/1.3,
                          child: Form(
                            autovalidate: true,
                            key: _formKey,
                            child:TextFormField(
                            validator: (value)=> value.isEmpty?" Bu kısım Boş bırakılamaz":null,
                            controller: editBody,
                            maxLines: 10,
                            maxLength: 300,
                            autofocus: true,
                            decoration: InputDecoration(
                              focusedErrorBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:BorderRadius.all(Radius.circular(12)) ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:BorderRadius.all(Radius.circular(12)) ),
                              hintText: "Yorumunuz",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(1, 186, 239, 1)),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                filled: true,
                               fillColor: Colors.white
                            ),
                          ), 
                            )
                        )
                   ],
                ),
              
         )
        ],
      ),
      ),
      )
    );
  }

}
