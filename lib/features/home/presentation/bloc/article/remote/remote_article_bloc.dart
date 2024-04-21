import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/resources/api_result.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/get_articles.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticlesEvent>(onGetArticles);
  }

  void onGetArticles(
      GetArticlesEvent event, Emitter<RemoteArticleState> emit) async {
    final result = await _getArticlesUseCase();

    if (result is Success && result.data!.isNotEmpty) {
      emit(RemoteArticleSuccess(result.data!));
    }

    if(result is Failure){
      emit(RemoteArticleFailed(result.exception!));
    }
  }
}

