import 'package:flutter/cupertino.dart';

import '../../../../apis/api_manger.dart';
import '../../../../model/source.dart';

class NewsViewModel extends ChangeNotifier {
  List<Source> sources = [];

  loadSources(String category) async {
    sources = await ApiManager.loadSources(category);
    notifyListeners();
  }
}