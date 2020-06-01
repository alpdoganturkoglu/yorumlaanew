import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



List <String> titlesearch =[];
List <String> slugsearch=[];
List <String> categorysearched=[];
class searchData{
  String title;
  bool agerest;
  String slug;
  String category;
  searchData({this.title,this.agerest,this.slug,this.category});
  factory searchData.fromJson(
    Map<String,dynamic> sDatatoParse){
      return searchData(
        title: sDatatoParse['title'],
        agerest: sDatatoParse['age_restriction'],
        slug: sDatatoParse['slug'],
        category: sDatatoParse['category']
      );
    }
}
void searchtoParse(jsonbody){
  for (int i=0 ; i<jsonbody.length; i++){
    var parsed = searchData.fromJson(jsonbody[i]);
    titlesearch.add(parsed.title);
    slugsearch.add(parsed.slug);
    categorysearched.add(parsed.category);
  }
}

Future <String> searchController(String searchText)async{
    titlesearch.clear();
    slugsearch.clear();
    categorysearched.clear();
    Map<String,dynamic> searchData ={
      "search": searchText,
    };
  var searchResponse = await http.post(
    "https://yorumlaa.herokuapp.com/api/products/search",
    body: jsonEncode(searchData),
    headers: {"Content-Type": "application/json"}
    );

  if(searchResponse.statusCode ~/ 100 == 2 ){

    searchtoParse(jsonDecode(searchResponse.body));
    return null;
  }
  else{
    return searchResponse.body.toString();
  }

}