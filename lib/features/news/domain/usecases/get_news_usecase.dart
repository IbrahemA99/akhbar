import '../ entities/news_entity.dart';
import '../repositories/home_repo.dart';

class GetNewsUseCase {
  final HomeRepo repo;

  GetNewsUseCase(this.repo);

  Future<NewsEntity> call(String sourceId) {
    return repo.getNews(sourceId);
  }
}