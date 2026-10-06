import 'package:news_forge/core/api/api_manager.dart';
import 'package:news_forge/core/api/end_point.dart';
import 'package:news_forge/core/cache_helper/hive_helper.dart';
import 'package:news_forge/core/constants/ApiKey.dart';
import 'package:news_forge/features/news/data/models/news_model.dart';
import 'package:news_forge/features/news/data/models/source_model.dart';
import 'package:news_forge/features/news/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiManager apiManager;

  HomeRepoImpl(this.apiManager);

  @override
  Future<SourceModel> getSources(String categoryId) async {
    try {
      final response = await apiManager.get(
        endPoint: EndPoints.sources,
        params: {"category": categoryId, "apiKey": Constants.apiKey},
      );

      final sourceModel = SourceModel.fromJson(response.data);

      await HiveHelper.saveSourceResponse(sourceModel);

      return (sourceModel);
    } catch (e) {
      final localSource = await HiveHelper.getSourceResponse();

      return (localSource!);
    }
  }

  @override
  Future<NewsModel> getNews(String sourceId) async {
    try {
      final response = await apiManager.get(
        endPoint: EndPoints.news,
        params: {"sources": sourceId, "apiKey": Constants.apiKey},
      );

      final newsModel = NewsModel.fromJson(response.data);

      await HiveHelper.saveNewsResponse(newsModel);

      return (newsModel);
    } catch (e) {
      final localNews = await HiveHelper.getNewsResponse();

      return (localNews!);
    }
  }

  @override
  Future<NewsModel> searchNews(String query) async {
    final response = await apiManager.get(
      endPoint: EndPoints.news,
      params: {"q": query, "apiKey": Constants.apiKey},
    );

    return NewsModel.fromJson(response.data);
  }
}
