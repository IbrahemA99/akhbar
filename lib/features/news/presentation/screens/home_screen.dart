import 'package:flutter/material.dart';
import 'package:akhbar/core/api/api_manager.dart';
import 'package:akhbar/core/constants/app_colors.dart';
import 'package:akhbar/core/constants/app_text.dart';
import 'package:akhbar/features/news/data/%20repositories/home_repo_implement.dart';
import 'package:akhbar/features/news/domain/usecases/get_news_usecase.dart';
import 'package:akhbar/features/news/domain/usecases/get_sources_usecase.dart';
import 'package:akhbar/features/news/presentation/cubit/cubit.dart';
import 'package:akhbar/features/news/presentation/cubit/states.dart';
import 'package:akhbar/features/news/presentation/widgets/news_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  final String categoryId;

  const HomeScreen({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
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
              leading: const Icon(
                Icons.arrow_back,
                color: AppColors.primary,
              ),
              title: Text(
                "Home",
                style: AppText.title,
              ),
              actions: const [
                Icon(
                  Icons.search,
                  color: AppColors.primary,
                ),
              ],
            ),

            body: state is GetSourcesLoadingState
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : state is GetSourcesErrorState
                ? const Center(
              child: Text("Something went wrong"),
            )
                : DefaultTabController(
              length: cubit.sourceEntity?.sources?.length ?? 0,
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) {
                      final sourceId = cubit
                          .sourceEntity!
                          .sources![index]
                          .id;

                      if (sourceId != null) {
                        cubit.getNews(sourceId);
                      }
                    },
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: AppColors.primary,
                    labelColor: AppColors.primary,
                    labelStyle: AppText.tabSelected,
                    unselectedLabelStyle:
                    AppText.tabUnSelected,
                    tabs: cubit.sourceEntity!.sources!
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