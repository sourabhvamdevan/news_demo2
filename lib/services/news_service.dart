import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/news_article.dart';

class NewsService {
  static Future<List<NewsArticle>> fetchNews(String category) async {
    final url =
        "${ApiConfig.baseUrl}/top-headlines?topic=$category&lang=en&country=in&token=${ApiConfig.apiKey}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List articles = body['articles'];

      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }
}
