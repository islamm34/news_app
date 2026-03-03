import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../apis/api_manger.dart';
import '../../../../model/source.dart';
import '../../../../ui/utilitis/resources.dart';

class NewsViewModel extends Cubit<NewsState> {
  // List<Source> sources = [];
  // bool isLoading = false;
  // String massageError = '';
  Resources sourcesApi = Resources.initial();

  NewsViewModel() : super(NewsState(sourcesApi: Resources.initial()));

  loadSources(String category) async {
    try {
      // isLoading = true;
      // sourcesApi = Resources.loading();
      // notifyListeners();
      emit(NewsState(sourcesApi: Resources.loading()));

      var sources = await ApiManager.loadSources(category);
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
