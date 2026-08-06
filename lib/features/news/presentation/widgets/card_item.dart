import 'package:flutter/material.dart';
import 'package:akhbar/core/constants/app_colors.dart';
import 'package:akhbar/core/constants/app_text.dart';
import 'package:akhbar/core/utils/utils.dart';
import 'package:akhbar/features/news/domain/%20entities/articale_entity.dart';
import 'package:akhbar/features/news/presentation/screens/details_screen.dart';


class CardItem extends StatelessWidget {
  final ArticleEntity article;

  const CardItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(
                article: article,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          border: Border.all(
            color: AppColors.border,
          ),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              child: Column(
                spacing: 8,
                children: [
                  Text(
                    article.title ?? "",
                    style: AppText.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.source?.name ?? "",
                        style: AppText.small,
                      ),
                      Text(
                        formatDate(article.publishedAt),
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