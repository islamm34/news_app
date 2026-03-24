import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/mapper/sources_mapper.dart';
import '../../../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../../domain/model/domain_source.dart';
import '../../../../ui/utilitis/resources.dart';
import 'news_view_model.dart';
import 'news_list.dart';
import '../../../../data/model/app_category.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;
  final NewsRemoteDataSource remoteDataSource;
  final SourcesMapper sourcesMapper;

  const NewsTab({
    Key? key,
    required this.category,
    required this.remoteDataSource,
    required this.sourcesMapper,
  }) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsViewModel>(
      create: (context) => NewsViewModel(
        remoteDataSource: widget.remoteDataSource,
        sourcesMapper: widget.sourcesMapper,
      )..loadSources(widget.category.name),
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          final resources = viewModel.sourcesApi;

          if (resources.apiState == ApiState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (resources.apiState == ApiState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${resources.massageError}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.loadSources(widget.category.name),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (resources.apiState == ApiState.success) {
            final sources = resources.data;
            if (sources == null || sources.isEmpty) {
              return const Center(child: Text('No sources available'));
            }
            return buildTabsList(sources);
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: sources
                .map((source) => Tab(child: Text(source.name)))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => NewsList(sourceId: source))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}