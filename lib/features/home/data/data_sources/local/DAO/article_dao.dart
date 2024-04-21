import 'package:floor/floor.dart';
import 'package:flutter_clean_arch/features/home/data/models/article_model.dart';

import '../constants.dart';

@dao
abstract class ArticleDao {
  @insert
  Future<void> insertArticle(ArticleModel articleModel);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query("SELECT * from $article_table_name")
  Future<List<ArticleModel>> getArticles();
}
