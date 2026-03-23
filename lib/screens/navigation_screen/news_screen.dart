import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_tabs.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import '../../data/model/app_category.dart';
import '../../ui/utilitis/providers/theme_provider.dart';
import '../widget/app_drawer.dart';
import '../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../data/mapper/sources_mapper.dart';

class NewsScreen extends StatefulWidget {
  final AppCategory category;
  const NewsScreen({super.key, required this.category});

  @override
  State<NewsScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NewsScreen> {
  late ThemeProvider themeProvider;
  late final NewsRemoteDataSourceImpl remoteDataSource;
  late final SourcesMapper sourcesMapper;

  @override
  void initState() {
    super.initState();
    remoteDataSource = NewsRemoteDataSourceImpl(dio: Dio());
    sourcesMapper = SourcesMapper();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      drawer: AppDrawer(),
      body: NewsTab(
        widget.category,
        Category: widget.category,
        remoteDataSource: remoteDataSource,
        sourcesMapper: sourcesMapper,
      ),
    );
  }
}
