import 'package:flutter/material.dart';

import '../../features/home/domain/entities/article.dart';
import '../../features/home/presentation/pages/details/article_details_page.dart';
import '../../features/home/presentation/pages/home/daily_news_page.dart';
import '../../features/home/presentation/pages/saved/saved_article_page.dart';




class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNewsPage());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNewsPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}