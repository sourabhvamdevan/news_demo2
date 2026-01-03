class AppSettings {
  final int numberOfItems;
  final String orderBy;
  final DateTime? fromDate;
  final String orderDate;
  final String colorTheme;
  final String textSize;

  AppSettings({
    this.numberOfItems = 5,
    this.orderBy = 'Newest',
    this.fromDate,
    this.orderDate = 'Published',
    this.colorTheme = 'Sky Blue',
    this.textSize = 'Medium',
  });

  AppSettings copyWith({
    int? numberOfItems,
    String? orderBy,
    DateTime? fromDate,
    String? orderDate,
    String? colorTheme,
    String? textSize,
  }) {
    return AppSettings(
      numberOfItems: numberOfItems ?? this.numberOfItems,
      orderBy: orderBy ?? this.orderBy,
      fromDate: fromDate ?? this.fromDate,
      orderDate: orderDate ?? this.orderDate,
      colorTheme: colorTheme ?? this.colorTheme,
      textSize: textSize ?? this.textSize,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numberOfItems': numberOfItems,
      'orderBy': orderBy,
      'fromDate': fromDate?.toIso8601String(),
      'orderDate': orderDate,
      'colorTheme': colorTheme,
      'textSize': textSize,
    };
  }

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      numberOfItems: json['numberOfItems'] ?? 5,
      orderBy: json['orderBy'] ?? 'Newest',
      fromDate: json['fromDate'] != null
          ? DateTime.parse(json['fromDate'])
          : null,
      orderDate: json['orderDate'] ?? 'Published',
      colorTheme: json['colorTheme'] ?? 'Sky Blue',
      textSize: json['textSize'] ?? 'Medium',
    );
  }
}
