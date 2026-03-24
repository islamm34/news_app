import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../data/model/app_category.dart';
import '../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../data/mapper/sources_mapper.dart';
import 'tabs/news_tab/news_tabs.dart';
import '../widget/app_drawer.dart';

class NewsScreen extends StatelessWidget {
  final AppCategory category;

  const NewsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final remoteDataSource = NewsRemoteDataSourceImpl(dio: dio);
    final sourcesMapper = SourcesMapper();

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      drawer: const AppDrawer(),
      body: NewsTab(
        category: category,
        remoteDataSource: remoteDataSource,
        sourcesMapper: sourcesMapper,
      ),
    );
  }
}