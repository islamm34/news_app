import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/news_repository/news_repository.dart';

import '../../../../apis/api_manger.dart';
import '../../../../model/source.dart';
import '../../../../ui/utilitis/resources.dart';

class NewsViewModel extends Cubit<NewsState> {
  Resources sourcesApi = Resources.initial();
  NewsViewModel() : super(NewsState(sourcesApi: Resources.initial()));
  NewsRepository repository = NewsRepository();
  loadSources(String category) async {
    try {
      // isLoading = true;
      // sourcesApi = Resources.loading();
      // notifyListeners();
      emit(NewsState(sourcesApi: Resources.loading()));

      var sources = await repository.loadSources(category);
      emit(NewsState(sourcesApi: Resources.success(sources)));
    } catch (e) {
      emit(NewsState(sourcesApi: Resources.error(e.toString())));
    }
  }
}

class NewsState {
  final Resources<List<Source>> sourcesApi;

  NewsState({required this.sourcesApi});
}
