import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/services/http.dart';
import 'package:flutter_application_1/models/newsdata.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String allArticles = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0bcc6818d60e47538838b2b8340216b0";


Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=0bcc6818d60e47538838b2b8340216b0'));
}



  Future<Articles> fetchProducts() async {
    final response = await http.get(Uri.parse(allArticles));
    

    if (response.statusCode == 200) {
      
      return Articles.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<Articles> fetchProduct(int productId) async {
    final response =
        await http.get(Uri.parse(allArticles + productId.toString()));

    if (response.statusCode == 200) {
      dynamic productJson = jsonDecode(response.body)["newsdata"];

      Articles articles = productModel(productJson);

      return articles;
    } else {
      throw Exception("Failed to load product");
    }
  }

  Future<List<Articles>> fetchArticle() async {
    final response = await http.get(Uri.parse(allArticles));

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body)["newsdata"];

      List<Articles> artic = productsModel(productsJson);

      return artic;
    } else {
      throw Exception("Failed to load products");
    }
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

  List<Articles> productsModel(List<dynamic> productsJson) {
    List<Articles> artic = [];

    for (dynamic i in productsJson) {
      if ( i["title"] == null ) {
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

 void main() => runApp(const MyApp1());

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  late Future<Articles> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: Center(
          child: FutureBuilder<Articles>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.description.toString());
              } 
              else if (snapshot.hasError) {
              return Text("${snapshot.error}");
              }
              

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}