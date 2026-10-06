import 'package:easy_localization/easy_localization.dart';

class CategoriesModel {
  String id;
  String name;
  String image;

  CategoriesModel({required this.id, required this.name, required this.image});

  static List<CategoriesModel> getCategories() {
    return [
       CategoriesModel(id: "general", name: "General", image: "general"),
      CategoriesModel(id: "business", name: "Business", image: "business"),
       CategoriesModel(id: "sports", name: "Sports", image: "sports"),
       CategoriesModel(id: "technology", name: "Technology" , image: "technology"),
      CategoriesModel(id: "entertainment", name: "Entertainment", image: "entertainment"),
      CategoriesModel(id: "health", name: "Health", image: "health"),
      CategoriesModel(id: "science", name: "Science", image: "science")
    ];
  }
}
