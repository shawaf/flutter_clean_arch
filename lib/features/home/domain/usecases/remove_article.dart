import 'package:flutter_clean_arch/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/features/home/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/home/domain/repository/article_repository.dart';

class RemoveArticleUseCase extends BaseUseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
