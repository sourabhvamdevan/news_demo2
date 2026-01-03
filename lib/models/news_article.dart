class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String source;
  final String publishedAt;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image'] ?? 'https://via.placeholder.com/300x200',
      source: json['source']['name'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
