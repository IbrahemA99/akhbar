import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_forge/core/api/api_manager.dart';
import 'package:news_forge/core/theme/app_text.dart';
import 'package:news_forge/features/news/data/models/categories_model.dart';
import 'package:news_forge/features/news/data/repositories/home_repo_implement.dart';
import 'package:news_forge/features/news/domain/usecases/get_news_usecase.dart';
import 'package:news_forge/features/news/domain/usecases/get_sources_usecase.dart';
import 'package:news_forge/features/news/presentation/cubit/cubit.dart';
import 'package:news_forge/features/news/presentation/widgets/app_drawer.dart';
import 'package:news_forge/features/news/presentation/widgets/category_list.dart';
import 'package:news_forge/features/news/presentation/widgets/news_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  final List<CategoriesModel> getCategories = CategoriesModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeRepo = HomeRepoImpl(ApiManager());

        return HomeCubit(GetSourcesUseCase(homeRepo), GetNewsUseCase(homeRepo));
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: isSearching
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                          searchController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    )
                  : null,

              title: Center(
                child: isSearching
                    ? TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            HomeCubit.get(context).searchNews(value);
                          }
                        },
                      )
                    : Text(
                        "Home".tr(),
                        style: AppText.headline.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
              ),

              actions: [
                if (!isSearching)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
              ],
            ),

            drawer: const AppDrawer(),

            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${"Good_Morning".tr()}\n${"Here_Is_Some_News_For_You".tr()}",
                    style: AppText.normal.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  SizedBox(height: 16),

                  isSearching ? Expanded(child: NewsWidget()) : CategoryList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
