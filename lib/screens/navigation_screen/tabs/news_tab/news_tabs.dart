import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../data/mapper/sources_mapper.dart';
import '../../../../data/model/app_category.dart';
import '../../../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../../domain/model/domain_source.dart';
import '../../../../ui/utilitis/resources.dart';
import 'news_list.dart';

class NewsTab extends StatefulWidget {
  final AppCategory Category;
  final NewsRemoteDataSource remoteDataSource;
  final SourcesMapper sourcesMapper;

  const NewsTab(
    AppCategory category, {
    Key? key,
    required this.Category,
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
      viewModel.loadSources(widget.Category.name);
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

          final resources = viewModel.sourcesApi;

          if (resources.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (resources.apiState == ApiState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${resources.massageError}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        viewModel.loadSources(widget.Category.name),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (resources.apiState == ApiState.success && resources.data != null) {
            return buildTabsList(resources.data!);
          } else {
            return const SizedBox();
          }
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
            tabs:
                sources.map((source) => Tab(child: Text(source.name))).toList(),
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