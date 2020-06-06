import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorumlaa/Controller/createCommentCont.dart';
import 'package:yorumlaa/Controller/productContreller.dart';


class makeComment extends StatefulWidget{
  const makeComment({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _makeCommentState();
}

class _makeCommentState extends State<makeComment>{
  var _formKey = GlobalKey<FormState>();
  double _value=5;
  double _value2=5;
  double _value3=5;
  double _value4=5;
  double _value5=5;
  int cPageint= 0;
  TextEditingController commentBody = TextEditingController();
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
                    var commentbodyto= commentBody.text.trim();
                   var control =await createComment
                    (commentbodyto, rName[0], rName[1], rName[2], rName[3], rName[4],_value.round(), _value2.round(), _value3.round(), _value4.round(), _value5.round(), "iphone-x");
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
              Text(_value.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
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
                        value: _value,
                        onChanged: (value){
                          setState(() {
                            _value=value;
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
              Text(_value2.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
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
                          value: _value2,
                          onChanged: (value){
                            setState(() {
                              _value2=value;
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
              Text(_value3.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
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
                          value: _value3,
                          onChanged: (value){
                            setState(() {
                              _value3=value;
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
              Text(_value4.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
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
                          value: _value4,
                          onChanged: (value){
                            setState(() {
                              _value4=value;
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
              Text(_value5.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
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
                          value: _value5,
                          onChanged: (value){
                            setState(() {
                              _value5=value;
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
                            controller: commentBody,
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
