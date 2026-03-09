import '../domain/model/domain_source.dart';

abstract class NewsRepository {
  Future<List<Source>> loadSources(String categoryName);
}