import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/news_article.dart';
import '../widgets/news_card.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = 'general';
  late Future<List<NewsArticle>> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = NewsService.fetchNews(category);
  }

  void changeCategory(String newCategory) {
    setState(() {
      category = newCategory;
      newsFuture = NewsService.fetchNews(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Khabar")),
      drawer: AppDrawer(onCategorySelected: changeCategory),
      body: FutureBuilder<List<NewsArticle>>(
        future: newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading news"));
          }

          final news = snapshot.data!;
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (_, i) => NewsCard(article: news[i]),
          );
        },
      ),
    );
  }
}
