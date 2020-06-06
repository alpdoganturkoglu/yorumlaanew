import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:yorumlaa/signin.dart';

List <String> commentP=[];
List <List<String>> comDetails=[];
List <String> comId =[];
List <List<String>> comT=[];
List <List<String>> commentUser=[];
List rating=[];
List productImages =[];
var inf;
List <productData> productD =[];
List <num> prdctrating=[];
List <String> rName=[];


class productImg{

    String imgUrl;
    productImg({this.imgUrl});
    factory productImg.fromJson(Map<String,dynamic> urlData){
      return productImg(
        imgUrl: urlData['image'],
        );
    }
}

class productR{
  num overall;
  Map part;
  productR({this.overall,this.part});
  factory productR.fromJson(Map <String,dynamic> rdata){
    return productR(
      overall: rdata['overall'],
      part: rdata['particularly']
    );
  }
}


void ratingJson(Map<String,dynamic> partData){
  partData.keys.forEach((element) {rName.add(element);});
  partData.values.forEach((element) {prdctrating.add(element);});
  
}


class comdetail{
  int comid ;
  String body;
  int like;
  int dislike;
  int product_id;
  int user_id;
  String username;
  String created;
  String updated;
  comdetail({this.comid,this.body,this.like,this.dislike,this.product_id,this.user_id,this.username,this.created,this.updated});
  factory comdetail.fromJson(Map<String,dynamic>comdata){
    return comdetail(
      comid: comdata['id'],
      body: comdata['body'],
      like: comdata['like'],
      dislike: comdata['dislike'],
      product_id: comdata['product_id'],
      user_id: comdata['user_id'],
      username: comdata['username'],
      created: comdata['created_at'],
      updated: comdata['updated_at']
    );
  }
}

class productComment{
  num av_rating;
  Map comment;
  String liked;
  productComment({this.av_rating,this.comment,this.liked});
  factory productComment.fromJson(Map<String,dynamic> commentData){
    return productComment(
      av_rating: commentData['rating'],
      comment:commentData['comment'],
      liked: commentData['like'],
    );
  } 
}

class productInf{
  int id;
  String title;
  bool approval;
  bool ageRes ;
  String slug;
  String created;
  String updated;
  String category;
  productInf({this.id,this.title,this.ageRes,this.approval,this.category,this.created,this.slug,this.updated});

  factory productInf.fromJson(Map<String,dynamic> productInfd){
    return productInf(
      id: productInfd['id'],
      title: productInfd['title'],
      approval: productInfd['aprroval'],
      ageRes: productInfd['age_restriction'],
      created: productInfd['created_at'],
      updated: productInfd['updated_at'],
      slug: productInfd['slug'],
      category: productInfd['category']
    );
  }


}
class productData{

  
  Map product;
 
  
  Map rating;
  bool following;
  List images;
  List<dynamic> breadcrumb;
  List<dynamic> comments;
  productData({this.product,this.rating,this.images,this.breadcrumb,this.comments,this.following});

  factory productData.fromJson(Map<String,dynamic> jsonProduct){
    
    return productData(
      images: jsonProduct['images'] as List,
      product: jsonProduct['product'] as Map,
      rating: jsonProduct['ratings'] as Map,
      breadcrumb: jsonProduct['breadcrump'] as List,
      comments: jsonProduct['comments'] as List<dynamic>,
      following: jsonProduct['following']
    );
  }
  
}

void imgParse(imageJson){
  for (int i =0 ; i<imageJson.length;i++){
    var img = productImg.fromJson(imageJson[i]);
    String lastImg = "https://yorumlaa.herokuapp.com"+img.imgUrl; 
    productImages.add(lastImg);
  }

}
List wld=[];
void commentParse(commentJson){
  for (int i =0 ; i<commentJson.length; i++){
    var com= productComment.fromJson(commentJson[i]);
    wld.add(com.liked);
    var commentL= comdetail.fromJson(com.comment);
    commentP.add(commentL.body);
    commentUser.add([commentL.user_id.toString(),commentL.username]);
    comDetails.add([commentL.like.toString(),commentL.dislike.toString()]);
    comId.add(commentL.comid.toString());
    comT.add([commentL.created,commentL.updated]);
    rating.add(com.av_rating);
    }
}
var productV;
void getProductData(Map product,List images,List breadcrumb,data){
  productV=data;
  productD.add(productData(product: product,images: images,breadcrumb: breadcrumb));
}
bool follow= false; 
List <String> prdctInf=[];
String slugtoref;
Future getProduct(String urlslug) async{
  slugtoref = urlslug;
  String urls= "https://yorumlaa.herokuapp.com/api/products/"+urlslug;
  if(jwt ==null){
    var response = await http.get(urls,headers: {"Content-Type": "application/json"});
    if(response.statusCode~/100 ==2){
    prdctrating.clear();
    rName.clear();
    commentP.clear();
    prdctInf.clear();
    wld.clear();
    rating.clear();
    productImages.clear();
    productD.clear();
    var data = productData.fromJson(jsonDecode(response.body));
    follow = data.following;
    debugPrint(data.toString());
    var inf =productInf.fromJson(data.product);
    prdctInf.add(inf.title);
    prdctInf.add(inf.id.toString());
    commentParse(data.comments);
    var product_rating= productR.fromJson(data.rating);
    ratingJson(product_rating.part);
    return  null;

  }
  else {

    return  response.statusCode.toString();

  }

  }
  else{
    var response = await http.get(urls,headers: {"Content-Type": "application/json","Authorization": jwt});
    if(response.statusCode~/100 ==2){
    prdctrating.clear();
    rName.clear();
    commentP.clear();
    wld.clear();
    prdctInf.clear();
    rating.clear();
    productImages.clear();
    productD.clear();
    var data = productData.fromJson(jsonDecode(response.body));
    follow = data.following;
    debugPrint(data.toString());
    var inf =productInf.fromJson(data.product);
    prdctInf.add(inf.title);
    prdctInf.add(inf.id.toString());
    commentParse(data.comments);
    var product_rating= productR.fromJson(data.rating);
    ratingJson(product_rating.part);
    return  null;

  }
  else {

    return  response.statusCode.toString();

  }

  }
  

}