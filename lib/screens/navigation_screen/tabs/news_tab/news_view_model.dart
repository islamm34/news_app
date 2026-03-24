import 'package:flutter/material.dart';
import '../../../../data/mapper/sources_mapper.dart';
import '../../../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../../domain/model/domain_source.dart';
import '../../../../domain/usecases/load_sources_usecase.dart';
import '../../../../ui/utilitis/resources.dart';

class NewsViewModel extends ChangeNotifier {
  final LoadSourcesUseCase loadSourcesUseCase;
  Resources<List<Source>> sourcesApi = Resources.initial();

  NewsViewModel({
    required NewsRemoteDataSource remoteDataSource,
    required SourcesMapper sourcesMapper,
  }) : loadSourcesUseCase = LoadSourcesUseCase(
    remoteDataSource: remoteDataSource,
    sourcesMapper: sourcesMapper,
  );

  Future<void> loadSources(String category) async {
    try {
      sourcesApi = Resources.loading();
      notifyListeners();

      final sources = await loadSourcesUseCase.call(category);

      sourcesApi = Resources.success(sources);
      notifyListeners();
    } catch (e) {
      sourcesApi = Resources.error(e.toString());
      notifyListeners();
    }
  }
}