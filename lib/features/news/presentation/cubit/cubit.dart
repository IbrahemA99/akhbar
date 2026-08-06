import 'package:akhbar/features/news/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/ entities/news_entity.dart';
import '../../domain/ entities/source_entity.dart';
import '../../domain/usecases/get_news_usecase.dart';
import '../../domain/usecases/get_sources_usecase.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSourcesUseCase getSourcesUseCase;
  final GetNewsUseCase getNewsUseCase;

  SourceEntity? sourceEntity;
  NewsEntity? newsEntity;

  HomeCubit(
      this.getSourcesUseCase,
      this.getNewsUseCase,
      ) : super(HomeInitState());

  static HomeCubit get(BuildContext context) {
    return BlocProvider.of<HomeCubit>(context);
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoadingState());

    try {
      sourceEntity = await getSourcesUseCase(categoryId);

      emit(GetSourcesSuccessState());

      if (sourceEntity?.sources?.isNotEmpty ?? false) {
        await getNews(
          sourceEntity!.sources![0].id!,
        );
      }
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoadingState());

    try {
      newsEntity = await getNewsUseCase(sourceId);

      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState(e.toString()));
    }
  }
}