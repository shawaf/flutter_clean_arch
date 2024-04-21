import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/features/home/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable{
  final ArticleEntity ? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticlesEvent extends LocalArticleEvent {
    const GetSavedArticlesEvent();
}

class SaveArticleEvent extends LocalArticleEvent {
  const SaveArticleEvent(ArticleEntity articleEntity) : super(article: articleEntity);
}

class RemoveArticleEvent extends LocalArticleEvent {
  const RemoveArticleEvent(ArticleEntity articleEntity) : super(article: articleEntity);
}