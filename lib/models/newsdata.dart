import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));


class Article {
  String status;
  int totalResults;
  List<Articles> articles;

  Article(
    {required this.status, required this.totalResults,required this.articles}
    );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
    status : json['status'],
    totalResults : json['totalResults'],
    articles : json['articles'],
    
    );
  }

  
  
}

class Articles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articles(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
    source : json['source'],
    author : json['author'],
    title : json['title'],
    description : json['description'],
    url : json['url'],
    urlToImage : json['urlToImage'],
    publishedAt :json['publishedAt'],
    content : json['content'],
    );
  }
  

  
}

class Source {
  String id;
  String name;

  Source({required this.id,required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name,
  };
}