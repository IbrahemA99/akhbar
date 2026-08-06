import 'package:akhbar/features/news/domain/%20entities/news_entity.dart';
import 'package:akhbar/features/news/domain/%20entities/source_entity.dart';

abstract class HomeRepo{

  Future<SourceEntity> getSources(String CategoryId);
  Future<NewsEntity> getNews(String SourceId );
}