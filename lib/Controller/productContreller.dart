import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class productData{

  int id;
  String title;
  bool approval;
  bool ageRes ;
  String created;
  String updated;
  String slug;
  String category;
  List images;
  List breadcrumb;
  productData({this.id,this.title,this.approval,this.ageRes,this.created,this.updated,this.slug,this.category,this.images,this.breadcrumb});

  factory productData.fromJson(Map<String,dynamic>jsonProduct){
    
    return productData(
      images: jsonProduct['images'],
      id: jsonProduct['id'],
      title: jsonProduct['title'],
      approval: jsonProduct['approval'],
      ageRes: jsonProduct['age_restriction'],
      created: jsonProduct['created_at'],
      updated: jsonProduct['updated_at'],
      slug: jsonProduct['slug'],
      category: jsonProduct['category'],    
      breadcrumb: jsonProduct['breadcrump']
    );
  }
  
}
List <productData> productD;
void getProductData(int id,String title,bool approval,bool ageRes ,String created,String updated,String slug,String category,List images,List breadcrumb,){
  productD.add(productData(id: id,title: title,approval: approval,ageRes: ageRes,created: created,updated: updated,slug: slug,category: category,images: images,breadcrumb: breadcrumb));
}
Future getProduct() async{

  var response = await http.get("https://yorumlaa.herokuapp.com/api/products/iphone-x");
  if(response.statusCode~/100 ==2){
    var data = productData.fromJson(jsonDecode(response.body));
    getProductData(data.id, data.title, data.approval, data.ageRes, data.created, data.updated, data.slug, data.category, data.images, data.breadcrumb);
    return  response.statusCode.toString();

  }
  else {

    return  response.statusCode.toString();

  }


}