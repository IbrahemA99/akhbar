import 'package:news_forge/features/news/data/models/news_model.dart';
import 'package:news_forge/features/news/data/models/source_model.dart';

abstract class HomeRepo {
  Future<SourceModel> getSources(String categoryId);

  Future<NewsModel> getNews(String sourceId);

  Future<NewsModel> searchNews(String query);
}
