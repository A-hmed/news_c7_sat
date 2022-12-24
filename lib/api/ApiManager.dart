import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c7_sat/model/news_response.dart';
import 'package:news_c7_sat/model/tabs_response.dart';
class ApiManager {
  static String baseUrl = "https://newsapi.org";
  static String apiKey = "a2803275cc264f5ab82151862011361a";

  static Future<TabsResponse> getTabs(String categoryId) async {
    var response =
    await http.get(Uri.parse("$baseUrl/v2/top-headlines/sources?apiKey=$apiKey&category=$categoryId"));
    var json = jsonDecode(response.body);
    TabsResponse tabsResponse = TabsResponse.fromJson(json);
    return tabsResponse;
  }

  static Future<NewsResponse> getNews(String? tabId, String? q,int page) async {
    var response = await
        http.get(Uri.parse("https://newsapi.org/v2/everything?apiKey=$apiKey&sources=$tabId"));
    var json = jsonDecode(response.body);
    print(json);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}