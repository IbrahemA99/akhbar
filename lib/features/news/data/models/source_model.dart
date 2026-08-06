import 'package:hive/hive.dart';
part 'source_model.g.dart';

@HiveType(typeId: 0)
class SourceModel {
  @HiveField(0)
  String? status;
  @HiveField(1)
  List<Sources>? sources;

  SourceModel({this.status, this.sources});

  SourceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }
}

@HiveType(typeId: 1)
class Sources {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? language;
  @HiveField(6)
  String? country;
  Sources();
  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
}
