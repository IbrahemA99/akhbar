import 'package:news_forge/features/news/data/models/news_model.dart';
import 'package:news_forge/features/news/domain/repositories/home_repo.dart';

class GetNewsUseCase {
  HomeRepo repo;

  GetNewsUseCase(this.repo);

  Future<NewsModel> call(String sourceId) {
    return repo.getNews(sourceId);
  }

  Future<NewsModel> searchNews(String query) {
    return repo.searchNews(query);
  }
}
