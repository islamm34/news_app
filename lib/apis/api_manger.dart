import 'package:dio/dio.dart';

import '../model/articles.dart';
import '../model/articles_response.dart';
import '../model/source.dart';
import '../model/sources_respones.dart';

abstract final class ApiManager {
  static const baseUrl = "https://newsapi.org";
  static const apiKey = "337dc2b5fe7c467aacde1b358cbe785b";
  static const sourcesApi = "/v2/top-headlines/sources";
  static const articleApi = "/v2/everything";

  static Future<List<Source>> loadSources(String category) async {
    Dio dio = Dio();
    Response response = await dio.get(
        "$baseUrl$sourcesApi?apiKey=$apiKey&category=$category");
    print(
        "status code = ${response.statusCode} response.data = ${response
            .data}");
    if (response.statusCode == 200) {
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse.sources!;
    }
    throw "Something went wrong please try again later";
  }

  static Future<List<Article>> loadArticles(String sourceId) async {
    Dio dio = Dio();
    Response response =
    await dio.get("$baseUrl$articleApi?apiKey=$apiKey&sources=$sourceId");
    if (response.statusCode == 200) {
      ArticlesResponse articlesResponse =
      ArticlesResponse.fromJson(response.data);
      return articlesResponse.articles!;
    }
    throw "Something went wrong please try again later";
  }
}
