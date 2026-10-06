import 'package:news_forge/features/news/data/models/categories_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_forge/core/api/api_manager.dart';
import 'package:news_forge/core/theme/app_text.dart';
import 'package:news_forge/features/news/data/repositories/home_repo_implement.dart';
import 'package:news_forge/features/news/domain/usecases/get_news_usecase.dart';
import 'package:news_forge/features/news/domain/usecases/get_sources_usecase.dart';
import 'package:news_forge/features/news/presentation/cubit/cubit.dart';
import 'package:news_forge/features/news/presentation/cubit/states.dart';
import 'package:news_forge/features/news/presentation/widgets/news_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsScreen extends StatelessWidget {
  static const String routeName = "NewsScreen";

  

  const NewsScreen({super.key ,});

  @override
  Widget build(BuildContext context) {
     final category = ModalRoute.of(context)!.settings.arguments as CategoriesModel;

    final categoryId = category.id;
    final categoryName = category.name;

    return BlocProvider(
      create: (context) {
        final homeRepo = HomeRepoImpl(ApiManager());

        return HomeCubit(
          GetSourcesUseCase(homeRepo),
          GetNewsUseCase(homeRepo),
        )..getSources(categoryId);
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);

          return Scaffold(
            appBar: AppBar(
               centerTitle: true,
             leading: IconButton(
  onPressed: () {
    Navigator.pop(context);
  },
  icon:  Icon(
    Icons.arrow_back,
    color: Theme.of(context).colorScheme.onSurface,
  ),
),
              title: Text(categoryName.tr(),
                style: AppText.normal.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              actions:  [
                Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),

            body: state is GetSourcesLoadingState
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : state is GetSourcesErrorState
                ? Center(
              child: Text("Something went wrong".tr()),
            )
                : DefaultTabController(
              length: cubit.sourceModel?.sources?.length ?? 0,
              child: Column(
                children: [
                  TabBar(onTap: (index) {final sourceId = cubit.sourceModel!.sources![index].id;

                      if (sourceId != null) {
                        cubit.getNews(sourceId);}
                    },
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: Theme.of(context).colorScheme.onSurface,
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    labelStyle: AppText.tabSelected,
                    unselectedLabelStyle:
                    AppText.tabUnSelected,
                    tabs: cubit.sourceModel!.sources!
                        .map(
                          (source) => Tab(
                        text: source.name,
                      ),
                    )
                        .toList(),
                  ),

                  const Expanded(
                    child: NewsWidget(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 