import 'package:flutter/material.dart';
import 'package:news_app/ui/utilitis/app_assets.dart';
import 'package:news_app/ui/utilitis/extension/context_extension.dart';

import '../../../../model/articles.dart';

class NewsWidget extends StatelessWidget {
  final Article article;
  const NewsWidget({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Image.network(
              article.urlToImage ?? "",
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text(article.title ?? ""),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By : ${article.author ?? ""} ",
                    style: context.textTheme.labelMedium,
                  ),
                ),
                Spacer(),
                Text("${article.publishedAt ?? ""} ", style: context.textTheme.labelMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
