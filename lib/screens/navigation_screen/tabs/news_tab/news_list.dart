import 'package:flutter/material.dart';
import '../../../../apis/api_manger.dart';
import '../../../../domain/model/domain_source.dart';
import '../../../widget/App_error_widget.dart';
import 'news_widget.dart';

class NewsList extends StatelessWidget {
  final Source sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadArticles(sourceId.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return AppErrorWidget(errorMessage: snapshot.error.toString());
        } else {
          final articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsWidget(article: articles[index]);
            },
          );
        }
      },
    );
  }
}