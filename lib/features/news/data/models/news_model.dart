import 'package:hive/hive.dart';
part 'news_model.g.dart';

@HiveType(typeId: 2)
class NewsModel {

  @HiveField(0)
  String? status;

  @HiveField(1)
  int? totalResults;

  @HiveField(2)
  List<Articles>? articles;

  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'] != null
          ? List<Articles>.from(
        json['articles'].map((x) => Articles.fromJson(x)),
      )
          : [],
    );
  }
}

@HiveType(typeId: 3)
class Articles {

  @HiveField(0)
  Source? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null
          ? Source.fromJson(json['source'])
          : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

@HiveType(typeId: 4)
class Source {

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}