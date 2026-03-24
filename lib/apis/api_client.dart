import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/model/sources_respones.dart';
import 'package:retrofit/http.dart';

import '../data/model/articles_response.dart';
import 'api_manger.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: ApiManager.baseurl)
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET(ApiManager.sourcesEndPoint)
  Future<SourcesResponse> loadSources(
    @Query("apiKey") String apiKey,
    @Query("category") String categoryName,
  );

  @GET(ApiManager.articlesEndPoint)
  Future<ArticlesResponse> loadArticles(
    @Query("apiKey") String apiKey,
    @Query("sources") String sourceId,
  );
}
