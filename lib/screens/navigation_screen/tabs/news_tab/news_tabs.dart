import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_list.dart';

import '../../../../apis/api_manger.dart';
import '../../../../model/app_category.dart';
import '../../../../model/source.dart';
import '../../../widget/App_error_widget.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;

  const NewsTab(this.category, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  NewsViewModel viewModel = NewsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.name);
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.controller.stream,
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Center(child: CircularProgressIndicator());
          }else {
            return buildTabsList(snapshot.data!);
          }
        });

    // return FutureBuilder(
    //     future: ApiManager.loadSources(widget.category.name),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return AppErrorWidget(message: snapshot.error.toString());
    //       } else if (snapshot.hasData) {
    //         return buildTabsList(snapshot.data!);
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     });
  }

  buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: sources
                .map((source) =>
                Tab(
                  child: Text(source.name ?? ""),
                ))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
                children: sources
                    .map((source) => NewsList(sourceId: source))
                    .toList()),
          )
        ],
      ),
    );
  }
}



class NewsViewModel{
  StreamController<List<Source>?> controller = StreamController();
  loadSources(String category) async {
    var sources = await ApiManager.loadSources(category);
    controller.add(sources);
  }
}