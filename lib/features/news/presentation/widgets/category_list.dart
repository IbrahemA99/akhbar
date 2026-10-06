import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_forge/core/theme/app_text.dart';
import 'package:news_forge/features/news/data/models/categories_model.dart';
import 'package:news_forge/features/news/presentation/screens/news_screen.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final List<CategoriesModel> getCategories = CategoriesModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: getCategories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "assets/images/${getCategories[index].image}.png",
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 30,
                left: index.isEven ? null : 30,
                right: index.isEven ? 50 : null,
                child: Text(
                  getCategories[index].name.tr(),
                  style: AppText.normal.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // View All
              Positioned(
                bottom: 16,
                left: index.isEven ? null : 16,
                right: index.isEven ? 16 : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(84),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NewsScreen.routeName,
                            arguments: getCategories[index],
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Text(
                            "ViewAll".tr(),
                            style: AppText.normal.copyWith(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
