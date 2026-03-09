import 'package:flutter/material.dart';
import '../../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../domain/model/domain_source.dart';
import '../../../domain/usecases/load_sources_usecase.dart';
import '../../../ui/utilitis/resources.dart';
import '../../mapper/sources_mapper.dart';

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
      // حالة التحميل
      sourcesApi = Resources.loading();
      notifyListeners();

      // تنفيذ الـ UseCase - هنا بيرجع List<Source> مباشرة
      final sources = await loadSourcesUseCase(category);

      // حالة النجاح
      sourcesApi = Resources.success(sources);
      notifyListeners();
    } catch (e) {
      // حالة الخطأ
      sourcesApi = Resources.error(e.toString());
      notifyListeners();
    }
  }
}