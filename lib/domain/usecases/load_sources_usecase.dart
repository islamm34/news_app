import '../../../data/model/remote_source.dart';
import '../../../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../../domain/model/domain_source.dart';
import '../../data/mapper/sources_mapper.dart';
class LoadSourcesUseCase {
  final NewsRemoteDataSource remoteDataSource;
  final SourcesMapper sourcesMapper;
  LoadSourcesUseCase({
    required this.remoteDataSource,
    required this.sourcesMapper,
  });
  Future<List<Source>> call(String category) async {
    try {
      final List<RemoteSource> remoteSources = await remoteDataSource.loadSources(category);
      return sourcesMapper.toSources(remoteSources);
    } catch (e) {
      throw Exception('Failed to load sources: $e');
    }
  }
}