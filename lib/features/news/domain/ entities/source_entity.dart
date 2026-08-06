class SourceEntity {
  final String? status;
  final List<SourceItemEntity>? sources;

  const SourceEntity({
    this.status,
    this.sources,
  });
}

class SourceItemEntity {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const SourceItemEntity({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });
}