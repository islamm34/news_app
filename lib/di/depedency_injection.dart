import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_view_model.dart';
import '../data/repository/news_repository/news_repository_pml.dart';
import '../data/mapper/sources_mapper.dart';
import '../data/repository/data_sources/remote_data_source/news_remote_data_source.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void initDependencies() {
  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  // Register SourcesMapper
  getIt.registerLazySingleton<SourcesMapper>(() => SourcesMapper());
  // Register NewsRemoteDataSource
  getIt.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  // Register NewsViewModel
  getIt.registerFactory<NewsViewModel>(
    () => NewsViewModel(
      remoteDataSource: getIt<NewsRemoteDataSource>(),
      sourcesMapper: getIt<SourcesMapper>(),
    ),
  );
}