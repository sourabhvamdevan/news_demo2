import 'package:flutter/material.dart';
import '../models/news_article.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(article.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              article.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(article.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "${article.source} • ${article.publishedAt.substring(0, 10)}",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
