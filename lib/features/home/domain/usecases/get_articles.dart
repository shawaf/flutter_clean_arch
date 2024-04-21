import 'package:flutter_clean_arch/core/resources/api_result.dart';
import 'package:flutter_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/features/home/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/home/domain/repository/article_repository.dart';

class GetArticlesUseCase extends BaseUseCase<APIResult<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticlesUseCase(this._articleRepository);

  @override
  Future<APIResult<List<ArticleEntity>>> call({void params}) {
      return _articleRepository.getNewsArticles();
  }

}