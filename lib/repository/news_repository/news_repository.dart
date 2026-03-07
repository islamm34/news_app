import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_app/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import '../../model/source.dart';

class NewsRepository {
  late NewsLocalDataSource localDataSource;
  late RemoteSource remoteDataSource;
  late Connectivity connectivity;
  // SourcesMapper sourcesMapper;

  // NewsRepositoryImpl({
  //   required this.remoteDataSource,
  //   required this.localDataSource,
  //   required this.connectivity,
  //   // required this.sourcesMapper
  // });

  Future<List<Source>> loadSources(String categoryName) async {
    final List<ConnectivityResult> connectivityResult = await (connectivity
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var remoteSources = await remoteDataSource.loadSources(categoryName);
      localDataSource.saveSources(categoryName, remoteSources);
      // return sourcesMapper.toSources(remoteSources);

      return remoteSources;
    } else {

      return await localDataSource.loadSources(categoryName) ?? [];
      // return sourcesMapper.toSources(await localDataSource.loadSources(categoryName) ?? []);
    }
  }
}
