import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_forge/core/theme/app_text.dart';
import 'package:news_forge/core/utils/utils.dart';
import 'package:news_forge/features/news/data/models/news_model.dart';
import 'package:news_forge/features/news/presentation/screens/details_screen.dart';

class CardItem extends StatelessWidget {
  final Articles article;

  const CardItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(article: article);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                article.urlToImage ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                spacing: 8,
                children: [
                  Text(
                    article.title ?? "".tr(),
                    style: AppText.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.source?.name ?? "".tr(),
                        style: AppText.small,
                      ),
                      Text(
                        formatDate(article.publishedAt).tr(),
                        style: AppText.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
