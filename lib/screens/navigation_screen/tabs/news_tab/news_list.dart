import 'package:flutter/material.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_widget.dart';

import '../../../../apis/api_manger.dart';

class NewsList extends StatelessWidget {
  final  Source sourceId;
  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadArticles(sourceId.id!),
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        } else {
          List<dynamic> articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsWidget(article: articles[index],);
            },
          );
        }
      },
    );
    // return ListView.builder(
    //   itemCount: 20,
    //   itemBuilder: (context, index) {
    //     return NewsWidget();
    //   },
    // );
  }

}
