import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/remove_article.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/save_article.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/local/local_article_state.dart';

import '../../../../domain/usecases/get_saved_articles.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticlesUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LoadingSavedArticles()) {
    on<GetSavedArticlesEvent>(onGetSavedArticles);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<SaveArticleEvent>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticlesEvent event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(ShowSavedArticles(articles));
  }

  void onSaveArticle(
      SaveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
  }

  void onRemoveArticle(
      RemoveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    emit(ShowSavedArticles(articles));
  }
}
