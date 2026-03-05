import '../../../apis/api_manger.dart';
import '../../../model/source.dart';

class RemoteSource {
  Future<List<Source>> loadSources(String categoryName) {
    return ApiManager.loadSources(categoryName);
  }
}
