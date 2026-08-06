
import 'package:akhbar/core/api/api_manager.dart';
import 'package:akhbar/core/api/end_point.dart';
import 'package:akhbar/core/cache_helper/hive_helper.dart';
import 'package:akhbar/core/constants/ApiKey.dart';
import 'package:akhbar/features/news/data/models/news_model.dart';
import 'package:akhbar/features/news/data/models/source_model.dart';
import 'package:akhbar/features/news/domain/%20entities/news_entity.dart';
import 'package:akhbar/features/news/domain/%20entities/source_entity.dart';
import 'package:akhbar/features/news/domain/repositories/home_repo.dart';

import '../mapper/news_mapper.dart';
import '../mapper/source_mapper.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiManager apiManager;

  HomeRepoImpl(this.apiManager);

  @override
  Future<SourceEntity> getSources(String categoryId) async {
    try {
      final response = await apiManager.get(
        endPoint: EndPoints.sources,
        params: {
          "category": categoryId,
          "apiKey": Constants.apiKey,
        },
      );

      final sourceModel = SourceModel.fromJson(response.data);

      await HiveHelper.saveSourceResponse(sourceModel);

      return SourceMapper.toEntity(sourceModel);
    } catch (e) {
      final localSource = await HiveHelper.getSourceResponse();

      return SourceMapper.toEntity(localSource!);
    }
  }

  @override
  Future<NewsEntity> getNews(String sourceId) async {
    try {
      final response = await apiManager.get(
        endPoint: EndPoints.news,
        params: {
          "sources": sourceId,
          "apiKey": Constants.apiKey,
        },
      );

      final newsModel = NewsModel.fromJson(response.data);

      await HiveHelper.saveNewsResponse(newsModel);

      return NewsMapper.toEntity(newsModel);
    } catch (e) {
      final localNews = await HiveHelper.getNewsResponse();

      return NewsMapper.toEntity(localNews!);
    }
  }
}