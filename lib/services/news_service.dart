import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/news_article.dart';

class NewsService {
  static Future<List<NewsArticle>> fetchNews(String category) async {
    final url =
        "${ApiConfig.baseUrl}/top-headlines?country=in&category=$category&apiKey=${ApiConfig.apiKey}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch news");
    }
  }
}
