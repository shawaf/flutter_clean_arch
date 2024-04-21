import 'package:flutter_clean_arch/core/resources/api_result.dart';
import 'package:flutter_clean_arch/features/home/domain/entities/article.dart';

abstract class ArticleRepository {
  //API Methods
  Future<APIResult<List<ArticleEntity>>> getNewsArticles();

  //Database Methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> removeArticle(ArticleEntity articleEntity);

  Future<void> saveArticle(ArticleEntity articleEntity);
}
