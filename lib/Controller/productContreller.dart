import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

List <comdetail> commentP=[];
List rating=[];
List productImages =[];
var inf;
var parsedrating;
List <productData> productD =[];



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
class toPartR{
  num r1;
  num r2;
  num r3;
  num r4;
  toPartR({this.r1,this.r2,this.r3,this.r4});
  factory toPartR.fromJson(Map<String,dynamic> partData){
    return toPartR(
      r1: partData[partData.keys],
      r2: partData[partData.keys],
      r3: partData[partData.keys],
      r4: partData[partData.keys]
    );
  }
  
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
  List<dynamic> comment;
  productComment({this.av_rating,this.comment});
  factory productComment.fromJson(Map<String,dynamic> commentData){
    return productComment(
      av_rating: commentData['rating'],
      comment:commentData['comment'],
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
  
  List images;
  List<dynamic> breadcrumb;
  List<dynamic> comments;
  productData({this.product,this.rating,this.images,this.breadcrumb,this.comments});

  factory productData.fromJson(Map<String,dynamic> jsonProduct){
    
    return productData(
      images: jsonProduct['images'] as List,
      product: jsonProduct['product'] as Map,
      rating: jsonProduct['ratings'] as Map,
      breadcrumb: jsonProduct['breadcrump'] as List,
      comments: jsonProduct['comments'] as List<dynamic>
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
void commentParse(commentJson){
  for (int i =0 ; i<commentJson.length; i++){
    var com= productComment.fromJson(commentJson[i]);
    commentP.add(comdetail.fromJson(com.comment[0]));
    rating.add(com.av_rating);
    }
}
var productV;
void getProductData(Map product,List images,List breadcrumb,data){
  productV=data;
  productD.add(productData(product: product,images: images,breadcrumb: breadcrumb));
}
List <String> prdctInf=[];

Future getProduct(String urlslug) async{

  String urls= "https://yorumlaa.herokuapp.com/api/products/"+urlslug;
  var response = await http.get(urls,headers: {"Content-Type": "application/json"});
  if(response.statusCode~/100 ==2){
    commentP.clear();
    prdctInf.clear();
    rating.clear();
    productImages.clear();
    productD.clear();
    var data = productData.fromJson(jsonDecode(response.body));
    var inf =productInf.fromJson(data.product);
    prdctInf.add(inf.title);
    prdctInf.add(inf.id.toString());
    var product_rating= productR.fromJson(data.rating);
    parsedrating = toPartR.fromJson(product_rating.part);
    
    return  null;

  }
  else {

    return  response.statusCode.toString();

  }


}