import 'package:news_forge/features/news/data/models/source_model.dart';
import 'package:news_forge/features/news/domain/repositories/home_repo.dart';

class GetSourcesUseCase {
  HomeRepo repo;

  GetSourcesUseCase(this.repo);

  Future<SourceModel> call(String categoryId) {
    return repo.getSources(categoryId);
  }
}
