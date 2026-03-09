import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/app_category.dart';
import '../../../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../view_model/mapper/sources_mapper.dart';
import '../../../view_model/news_view_model.dart';
import 'news_list.dart';

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
  late NewsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsViewModel(
        remoteDataSource: widget.remoteDataSource,
        sourcesMapper: widget.sourcesMapper,
      ),
      child: Builder(
        builder: (context) {
          viewModel = Provider.of<NewsViewModel>(context, listen: true);

          // استخدام Resources للحالات المختلفة
          final resources = viewModel.sourcesApi;

          return resources.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (sources) => buildTabsList(sources),
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.loadSources(widget.category.name),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            initial: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget buildTabsList(List<Source> sources) {
    if (sources.isEmpty) {
      return const Center(child: Text('No sources available'));
    }

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
                  .map((source) => NewsList(sourceId: source.id))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}