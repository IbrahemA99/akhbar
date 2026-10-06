import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_forge/features/news/data/models/news_model.dart';
import 'package:news_forge/features/news/data/models/source_model.dart';
import 'package:news_forge/features/news/domain/usecases/get_news_usecase.dart';
import 'package:news_forge/features/news/domain/usecases/get_sources_usecase.dart';
import 'package:news_forge/features/news/presentation/cubit/states.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSourcesUseCase getSourcesUseCase;
  final GetNewsUseCase getNewsUseCase;

  SourceModel? sourceModel;
  NewsModel? newsModel;

  HomeCubit(this.getSourcesUseCase, this.getNewsUseCase)
    : super(HomeInitState());

  static HomeCubit get(BuildContext context) {
    return BlocProvider.of<HomeCubit>(context);
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoadingState());

    try {
      sourceModel = await getSourcesUseCase(categoryId);

      emit(GetSourcesSuccessState());

      if (sourceModel?.sources?.isNotEmpty ?? false) {
        await getNews(sourceModel!.sources![0].id!);
      }
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoadingState());

    try {
      newsModel = await getNewsUseCase(sourceId);

      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState(e.toString()));
    }
  }

  Future<void> searchNews(String query) async {
    emit(GetNewsLoadingState());

    try {
      newsModel = await getNewsUseCase.searchNews(query);

      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState(e.toString()));
    }
  }
}
