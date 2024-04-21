import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LoadingSavedArticles extends LocalArticleState {
  const LoadingSavedArticles();
}

class ShowSavedArticles extends LocalArticleState {
  const ShowSavedArticles(List<ArticleEntity> articles)
      : super(articles: articles);
}
