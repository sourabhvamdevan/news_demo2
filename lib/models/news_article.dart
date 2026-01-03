class NewsArticle {
  final String id;
  final String title;
  final String category;
  final String description;
  final String author;
  final DateTime publishedAt;
  final String imageUrl;
  final String sourceUrl;

  NewsArticle({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.imageUrl,
    required this.sourceUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? 'Unknown',
      publishedAt: DateTime.parse(
        json['publishedAt'] ?? DateTime.now().toIso8601String(),
      ),
      imageUrl: json['imageUrl'] ?? '',
      sourceUrl: json['sourceUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'author': author,
      'publishedAt': publishedAt.toIso8601String(),
      'imageUrl': imageUrl,
      'sourceUrl': sourceUrl,
    };
  }

  String getTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }
  }
}

// models/category.dart
enum NewsCategory {
  home,
  world,
  science,
  sport,
  environment,
  society,
  fashion,
  business,
  culture,
}

extension NewsCategoryExtension on NewsCategory {
  String get displayName {
    switch (this) {
      case NewsCategory.home:
        return 'HOME';
      case NewsCategory.world:
        return 'WORLD';
      case NewsCategory.science:
        return 'SCIENCE';
      case NewsCategory.sport:
        return 'SPORT';
      case NewsCategory.environment:
        return 'ENVIRONMENT';
      case NewsCategory.society:
        return 'SOCIETY';
      case NewsCategory.fashion:
        return 'FASHION';
      case NewsCategory.business:
        return 'BUSINESS';
      case NewsCategory.culture:
        return 'CULTURE';
    }
  }

  String get apiValue {
    return name;
  }
}
