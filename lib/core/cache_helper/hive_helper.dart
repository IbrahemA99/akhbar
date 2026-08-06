import 'package:hive/hive.dart';

import '../../features/news/data/models/news_model.dart';
import '../../features/news/data/models/source_model.dart';

class HiveHelper {

  static const String sourceKey = "SourceKey";
  static const String newsKey = "NewsKey";

  static const String sourceBox = "SourcesBox";
  static const String newsBox = "NewsBox";


  static Future<Box<SourceModel>> _openSourceBox() async {

    if (!Hive.isBoxOpen(sourceBox)) {
      await Hive.openBox<SourceModel>(sourceBox);
    }

    return Hive.box<SourceModel>(sourceBox);
  }


  static Future<void> saveSourceResponse(SourceModel source) async {

    final box = await _openSourceBox();

    await box.put(sourceKey, source);
  }


  static Future<SourceModel?> getSourceResponse() async {

    final box = await _openSourceBox();

    return box.get(sourceKey);
  }


  static Future<void> deleteSourceResponse() async {

    final box = await _openSourceBox();

    await box.delete(sourceKey);
  }



  static Future<Box<NewsModel>> _openNewsBox() async {

    if (!Hive.isBoxOpen(newsBox)) {
      await Hive.openBox<NewsModel>(newsBox);
    }

    return Hive.box<NewsModel>(newsBox);
  }

  static Future<void> saveNewsResponse(NewsModel news) async {

    final box = await _openNewsBox();

    await box.put(newsKey, news);
  }

  static Future<NewsModel?> getNewsResponse() async {

    final box = await _openNewsBox();

    return box.get(newsKey);
  }

  static Future<void> deleteNewsResponse() async {

    final box = await _openNewsBox();

    await box.delete(newsKey);
  }

}