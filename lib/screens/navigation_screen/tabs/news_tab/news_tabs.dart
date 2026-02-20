import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_list.dart';

import '../../../../apis/api_manger.dart';
import '../../../../model/app_category.dart';
import '../../../../model/source.dart';
import '../../../widget/App_error_widget.dart';

class NewsTabs extends StatelessWidget {
  final AppCategory category;
  const NewsTabs(this.category,{super.key,  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadSources(category.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return AppErrorWidget(errorMessage: snapshot.error.toString());
        } else {
          return buildTabsList(snapshot.data as List<Source>);
        }
      },
    );
  }

  buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Colors.red,
            tabs: sources
                .map((source) => Tab(text: source.name ?? ""))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources.map((source) => NewsList(sourceId: source,)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
