// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../apis/api_client.dart' as _i588;
import '../data/mapper/sources_mapper.dart' as _i1018;
import '../data/repository/data_sources/local_data_source/news_local_data_source.dart'
    as _i197;
import '../data/repository/data_sources/remote_data_source/news_remote_data_source.dart'
    as _i36;
import '../data/repository/news_repository/news_repository_pml.dart' as _i115;
import '../domain/repository/news_repository.dart' as _i263;
import 'git_it_module.dart' as _i710;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final gitItModule = _$GitItModule();
  gh.factory<_i1018.SourcesMapper>(() => _i1018.SourcesMapper());
  gh.factory<_i895.Connectivity>(() => gitItModule.createconnectivity);
  gh.factory<_i361.Dio>(() => gitItModule.createDio);
  gh.factory<_i588.ApiClient>(
    () => _i588.ApiClient(gh<_i361.Dio>(), baseUrl: gh<String>()),
  );
  gh.factory<_i36.NewsRemoteDataSource>(
    () => _i36.NewsRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
  );
  gh.factory<_i197.NewsLocalDataSource>(() => _i197.NewsLocalDataSourceImpl());
  gh.factory<_i263.NewsRepository>(
    () => _i115.NewsRepositoryImpl(
      remoteDataSource: gh<_i36.NewsRemoteDataSource>(),
      localDataSource: gh<_i197.NewsLocalDataSource>(),
      connectivity: gh<_i895.Connectivity>(),
      sourcesMapper: gh<_i1018.SourcesMapper>(),
    ),
  );
  return getIt;
}

class _$GitItModule extends _i710.GitItModule {}
