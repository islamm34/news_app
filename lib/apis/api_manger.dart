
import 'package:dio/dio.dart';

import '../data/model/articles.dart';
import '../data/model/articles_response.dart';
import '../data/model/remote_source.dart';
import '../data/model/sources_respones.dart';
import '../domain/model/domain_source.dart';

abstract final class ApiManager {
  static const apiKey = "337dc2b5fe7c467aacde1b358cbe785b";
  static const baseurl = "https://newsapi.org";
  static const sourcesEndPoint = "/v2/top-headlines/sources";
  static const articlesEndPoint = "/v2/everything";

  static Future<List<RemoteSource>> loadSources(String categoryName) async {
    final dio = Dio();
    // Response response =
    //     await dio.get("$baseurl$sourcesEndPoint?apiKey=$apiKey&category=$categoryName");
    Response response =
    await dio.get("$baseurl$sourcesEndPoint", queryParameters: {
      "apiKey": apiKey,
      "category": categoryName,
    });
    print(
        "loadSources:response.statusCode= ${response.statusCode} response: ${response.data}");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map json = response.data;
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse.sources!;
    }
    throw "Something went wrong please try again later";
  }

  static Future<List<Article>> loadArticles(String sourceId) async {
    final dio = Dio();
    Response response = await dio
        .get("$baseurl$articlesEndPoint?apiKey=$apiKey&sources=$sourceId");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map json = response.data;
      ArticlesResponse articleResponse = ArticlesResponse.fromJson(json);
      return articleResponse.articles!;
    }
    throw "Something went wrong please try again later";
  }
}
