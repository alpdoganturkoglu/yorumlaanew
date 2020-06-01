import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

List <String> imgtoshowl=[];
List <String> titletoshowl=[];
List <num> ratingtoshowl=[];
List <String> pSlug =[];
class imgfor{
    String imgUrll;
    imgfor({this.imgUrll});
    factory imgfor.fromJson(Map<String,dynamic> urlData){
      return imgfor(
        imgUrll: urlData['image'],
        );
    }
}
class productsdata{
  int id;
  String title;
  bool approval;
  bool agerest;
  String created;
  String updated;
  String slug;
  String category;
  productsdata({this.id,this.title,this.approval,this.agerest,this.created,this.updated,this.slug,this.category});
  factory productsdata.fromJson(
    Map<String,dynamic> productstoParse){
      return productsdata(
        id: productstoParse['id'] as int,
        title: productstoParse['title'] as String,
        approval: productstoParse['approval'] as bool,
        agerest: productstoParse['age_restriction'] as bool,
        created: productstoParse['created_at'] as String,
        updated: productstoParse['updated_at'] as String,
        slug: productstoParse['slug'] as String,
        category: productstoParse['category'] as String
      );
    }
} 
class catsdata{
  Map product;
  List img;
  Map rating;
  catsdata({this.product,this.img,this.rating});
  factory catsdata.fromJson(Map <String,dynamic> catstoparse){
    return catsdata(
      img: catstoparse['images'] as List,
      product: catstoparse['product'],
      rating: catstoparse['ratings']
    );
  }
}

class ratingsData{
  num overral;
  ratingsData({this.overral});
  factory ratingsData.fromJson(Map <String,dynamic> rdata){
    return ratingsData(
      overral:rdata['overall']
      );
  }
}

void catstoParse(jsonbody){
  for (int i=0 ; i<jsonbody.length; i++){
    
    var parsed = catsdata.fromJson(jsonbody[i]);
    var returnImg =imgfor.fromJson(parsed.img[0]);
    var overallr = ratingsData.fromJson(parsed.rating);
    var returnPInf = productsdata.fromJson(parsed.product);
    String lastImg = "https://yorumlaa.herokuapp.com"+ returnImg.imgUrll;
    pSlug.add(returnPInf.slug);
    ratingtoshowl.add(overallr.overral);
    imgtoshowl.add(lastImg);
    titletoshowl.add(returnPInf.title);
  }
}
class first{

  List products;
  first({this.products});
  factory first.fromJson(Map<String,dynamic> firstParse){
    return first(
      products: firstParse['products'],
    );
  }

}

Future<String> categorySearch(String catName) async {
    imgtoshowl.clear();
    titletoshowl.clear();
    ratingtoshowl.clear();
    Map<String,dynamic> categorySearchData= {
        "category": catName,
    };
  var catsResponse =await http.post(
    "https://yorumlaa.herokuapp.com/api/products/search_by_category",
    body: jsonEncode(categorySearchData),
    headers: {"Content-Type": "application/json"} 
  );
  if((catsResponse.statusCode~/100) == 2){
    var firstp =first.fromJson(jsonDecode(catsResponse.body));
    debugPrint(jsonDecode(catsResponse.body).toString());
    catstoParse(firstp.products);
    return null;
  }
  else{
    return catsResponse.body.toString();
  }
}