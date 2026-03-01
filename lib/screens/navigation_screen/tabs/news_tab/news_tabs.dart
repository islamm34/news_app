import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_list.dart';
import 'package:provider/provider.dart';

import '../../../../model/app_category.dart';
import '../../../../model/source.dart';
import '../../../../ui/utilitis/resources.dart';
import 'news_view_model.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;

  const NewsTab(this.category, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel= NewsViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
          viewModel = context.read<NewsViewModel>();
          if (state.sourcesApi.apiState == ApiState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.sourcesApi.apiState == ApiState.error) {
            return Center(child: Text(state.sourcesApi.massageError!));
          } else
            state.sourcesApi.apiState == ApiState.success;
          return buildTabsList(state.sourcesApi.data ?? []);
        },
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => NewsViewModel(),
    //   child: Builder(
    //     builder: (context) {
    //       // viewModel = Provider.of(context, listen: true);
    //       return Consumer<NewsViewModel>(
    //         builder: (context, viewModel, _) {
    //           this.viewModel = viewModel;
    //           if (viewModel.sourcesApi.apiState == ApiState.loading) {
    //             return Center(child: CircularProgressIndicator());
    //           } else if (viewModel.sourcesApi.apiState == ApiState.error) {
    //             return Center(child: Text(viewModel.sourcesApi.massageError!));
    //           } else
    //             viewModel.sourcesApi.apiState == ApiState.success;
    //           return buildTabsList(viewModel.sourcesApi.data ?? []);
    //         },
    //       );
    //     },
    //   ),
    // );

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
                .map((source) => Tab(child: Text(source.name ?? "")))
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
