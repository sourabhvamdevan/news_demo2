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
