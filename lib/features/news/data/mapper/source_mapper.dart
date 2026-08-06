import '../../domain/ entities/source_entity.dart';
import '../models/source_model.dart';

class SourceMapper {
  static SourceEntity toEntity(SourceModel model) {
    return SourceEntity(
      status: model.status,
      sources: model.sources?.map((source) {
        return SourceItemEntity(
          id: source.id,
          name: source.name,
          description: source.description,
          url: source.url,
          category: source.category,
          language: source.language,
          country: source.country,
        );
      }).toList(),
    );
  }
}