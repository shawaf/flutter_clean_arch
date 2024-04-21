import 'package:flutter_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/features/home/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/home/domain/repository/article_repository.dart';

class GetSavedArticlesUseCase extends BaseUseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticlesUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
