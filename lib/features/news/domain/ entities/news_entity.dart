import 'articale_entity.dart';

class NewsEntity {
  final String? status;
  final int? totalResults;
  final List<ArticleEntity>? articles;

  const NewsEntity({
    this.status,
    this.totalResults,
    this.articles,
  });
}