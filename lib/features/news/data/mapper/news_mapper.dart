import '../../domain/ entities/articale_entity.dart';
import '../../domain/ entities/articale_source_entity.dart';
import '../../domain/ entities/news_entity.dart';
import '../models/news_model.dart';
class NewsMapper {
  static NewsEntity toEntity(NewsModel model) {
    return NewsEntity(
      status: model.status,
      totalResults: model.totalResults,
      articles: model.articles?.map((article) {
        return ArticleEntity(
          source: article.source == null ? null : ArticleSourceEntity(
            id: article.source!.id,
            name: article.source!.name),
            author: article.author,
            title: article.title,
            description: article.description,
            url: article.url,
            urlToImage: article.urlToImage,
            publishedAt: article.publishedAt,
            content: article.content,);
               }).toList(),
    );
  }
}