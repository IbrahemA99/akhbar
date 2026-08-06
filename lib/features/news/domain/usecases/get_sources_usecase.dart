
import '../ entities/source_entity.dart';
import '../repositories/home_repo.dart';

class GetSourcesUseCase {
  final HomeRepo repo;

  GetSourcesUseCase(this.repo);

  Future<SourceEntity> call(String categoryId) {
    return repo.getSources(categoryId);
  }
}