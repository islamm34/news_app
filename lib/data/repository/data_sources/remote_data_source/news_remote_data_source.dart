import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:news_app/apis/api_client.dart';
import '../../../model/remote_source.dart';
import '../../../model/sources_respones.dart';

abstract class NewsRemoteDataSource {
  Future<List<RemoteSource>> loadSources(String category);
}

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;
  final ApiClient apiClient;

  // مفتاح API الخاص بك
  static const String apiKey = "337dc2b5fe7c467aacde1b358cbe785b";

  NewsRemoteDataSourceImpl({required this.dio}) : apiClient = ApiClient(dio);

  @override
  Future<List<RemoteSource>> loadSources(String category) async {
    try {
      final sourcesResponse = await apiClient.loadSources(apiKey, category);
      // If you need to convert SourcesResponse to List<RemoteSource>, do it here
      // For now, assuming RemoteSource == Source
      return sourcesResponse.sources ?? [];
    } catch (e) {
      print('Error loading sources: $e');
      rethrow;
    }
  }
}