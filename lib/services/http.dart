import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:flutter_application_1/models/newsdata.dart';
// import 'package:Var_application/lib/models/news.dart';



class Http {

  String allArticles = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0bcc6818d60e47538838b2b8340216b0";


  Future<List<Articles>> fetchProducts() async {
    final response = await http.get(Uri.parse(allArticles));

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body)["products"];

      List<Articles> articles = productsModel(productsJson);

      return articles;
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<Articles> fetchProduct(int productId) async {
    final response =
        await http.get(Uri.parse(allArticles + productId.toString()));

    if (response.statusCode == 200) {
      dynamic productJson = jsonDecode(response.body)["product"];

      Articles articles = productModel(productJson);

      return articles;
    } else {
      throw Exception("Failed to load product");
    }
  }







  List<Articles> productsModel(List<dynamic> productsJson) {
    List<Articles> artic = [];

    for (dynamic i in productsJson) {
      if (i["source"] == null || i["author"] == null || i["avatar"] == null) {
        continue;
      }
      String description = " ";
      if (i["description"] != null) {
        description = i["description"];
      }
      Articles articles = Articles(
          source: i["source"],
          author: i["author"],
          title: i["title"],
          description: description,
          url: i["url"],
          urlToImage: i["urlToImage"],
          publishedAt: i["publishedAt"],
          content: i["content"],);

      artic.add(articles);
    }
    return artic;
  }




  Articles productModel(dynamic productJson) {
    Articles product = Articles(
        source: productJson["source"],
          author: productJson["author"],
          title: productJson["title"],
          description: productJson["description"],
          url: productJson["url"],
          urlToImage: productJson["urlToImage"],
          publishedAt: productJson["publishedAt"],
          content: productJson["content"],
        );

    return product;
  }


  Future<List<Articles>> fetchArticle() async {
    final response = await http.get(Uri.parse(allArticles));

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body)["products"];

      List<Articles> artic = productsModel(productsJson);

      return artic;
    } else {
      throw Exception("Failed to load products");
    }
  }




}
