import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storepro/model/product.dart';

import '../model/categoriesmodel.dart';
import '../model/categorymodel.dart';
import '../model/productsmodel.dart';
import '../model/usermodel.dart';
class Apiservice{

  static Future<List<ProductsModel>> getallproducts ()async{
    List<ProductsModel> products=[];
    List<ProductsModel> posts=[];
    var response=await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    if(response.statusCode==200){
      var  body = jsonDecode(response.body);
     posts = body
          .map(
            ( item) => ProductsModel.fromJson(item),
      ).toList();
      ProductsModel productsModel=ProductsModel.fromJson(jsonDecode(response.body));
      products.add(productsModel);
    print("trueeee $posts");
    }
    else{
      print("falllllllse");
    }

    return posts;
}
  static Future<ProductModel> getproduct (int id)async{
    var response=await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products/$id"));
    ProductModel productModel=ProductModel.fromJson(jsonDecode(response.body));

    return productModel;
  }

  static Future<List<CategoriesModel>> getallcategories ()async{
    List<CategoriesModel> categories=[];
    var response=await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
    CategoriesModel categoriesModel=CategoriesModel.fromJson(jsonDecode(response.body));
    categories.add(categoriesModel);
    return categories;
  }
  static Future<CategoryModel> getcategory (int id)async{
    var response=await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories/$id"));
    CategoryModel categoryModel=CategoryModel.fromJson(jsonDecode(response.body));
    return categoryModel;
  }
  static Future<List<UserModel>> getallusers ()async{
    List<UserModel>users=[];
    var response=await http.get(Uri.parse("https://api.escuelajs.co/api/v1/users"));
    UserModel userModel=UserModel.fromJson(jsonDecode(response.body));
    users.add(userModel);
    return users;
  }
}