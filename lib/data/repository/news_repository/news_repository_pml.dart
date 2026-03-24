import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import '../../../domain/model/domain_source.dart';
import '../../../domain/repository/news_repository.dart';
import '../../mapper/sources_mapper.dart';
import '../data_sources/local_data_source/news_local_data_source.dart';
import '../data_sources/remote_data_source/news_remote_data_source.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsLocalDataSource localDataSource;
  final NewsRemoteDataSource remoteDataSource;
  final Connectivity connectivity;
  final SourcesMapper sourcesMapper;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
    required this.sourcesMapper,
  });

  @override
  Future<List<Source>> loadSources(String categoryName) async {
    final List<ConnectivityResult> connectivityResult =
    await connectivity.checkConnectivity();

    final bool isConnected = connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);

    if (isConnected) {
      try {
        // متصل بالانترنت - جلب من API
        final remoteSources = await remoteDataSource.loadSources(categoryName);

        // حفظ في المحلي (في الخلفية)
        unawaited(localDataSource.saveSources(categoryName, remoteSources));

        // تحويل وإرجاع
        return sourcesMapper.toSources(remoteSources);
      } catch (e) {
        print('Error loading from remote: $e');
        // لو فشل الاتصال بالـ API، جرب المحلي
        final localSources = await localDataSource.loadSources(categoryName) ?? [];
        return sourcesMapper.toSources(localSources);
      }
    } else {
      // غير متصل - جلب من المحلي
      final localSources = await localDataSource.loadSources(categoryName) ?? [];
      return sourcesMapper.toSources(localSources);
    }
  }
}