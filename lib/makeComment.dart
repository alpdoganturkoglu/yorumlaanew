import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yorumlaa/main.dart';


class makeComment extends StatefulWidget{
  const makeComment({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _makeCommentState();
}

class _makeCommentState extends State<makeComment>{

  double _value=5;
  double _value2=5;
  double _value3=5;
  double _value4=5;
  double _value5=5;
  int cPageint= 0;
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
      appBar:AppBar(
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
          icon: Icon(
            Icons.notifications_none,
            color: Color.fromRGBO(1, 186, 239, 1),
          ),
        )
      ],
    ),
      floatingActionButton:Row(

       children: <Widget>[
         cPage() ==0?Stack(

           children: <Widget>[
             Align(
               alignment: Alignment.bottomRight,
               child: FloatingActionButton(
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
               alignment: Alignment.bottomLeft,
               child: FloatingActionButton(
                 onPressed: (){
                   mcomment.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                 },
                 child: Icon(
                     Icons.arrow_back
                 ),
               ),
             ),
             Align(
               alignment: Alignment.bottomRight,
               child: FloatingActionButton(
                 onPressed: (){
                   Navigator.pop(context);
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
          SizedBox(
          width: 400,
          height: 800,
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
                width: 300,
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
                        divisions: 10,
                        min: 0,
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
                  width: 300,
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
                          divisions: 10,
                          min: 0,
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
                  width: 300,
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
                          divisions: 10,
                          min: 0,
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
                  width: 300,
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

                          divisions: 10,
                          min: 0,
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
                  width: 300,
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
                          divisions: 10,
                          min: 0,
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
         Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient: LinearGradient(
                            colors: [ Color.fromRGBO(1, 186, 239, 1), Color.fromRGBO(32, 191, 85, 1)]
                        )
                    ),
                    height: 400,
                    width: 300,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Yorumlaayın.",
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20),),
                        SizedBox(

                          width: 280,
                          child: TextField(
                            maxLines: 10,
                            maxLength: 2000,
                            autofocus: false,
                            decoration: InputDecoration(

                              hintText: "Yorumunuz",
                                enabledBorder: OutlineInputBorder(

                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                                focusedBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                filled: true,
                               fillColor: Colors.white
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ],
         )
        ],
      ),
      ),
      )
    );
  }

}