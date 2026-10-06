import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_forge/core/theme/app_text.dart';
import 'package:news_forge/core/utils/utils.dart';
import 'package:news_forge/features/news/data/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Articles article;

  const DetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details".tr())),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.urlToImage ?? "",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 250,
                  child: Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.source?.name ?? "".tr(), style: AppText.small),
                  SizedBox(height: 10),
                  Text(
                    article.title ?? "".tr(),
                    style: AppText.headline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(article.description ?? "".tr(), style: AppText.body),
                  SizedBox(height: 10),
                  Text(formatDate(article.publishedAt), style: AppText.small),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: openArticle,
                    child: Text("Read Full Article"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openArticle() async {
    if (article.url == null) return;
    final uri = Uri.parse(article.url!);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
