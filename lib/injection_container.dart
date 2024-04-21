import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/features/home/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_arch/features/home/data/data_sources/local/constants.dart';
import 'package:flutter_clean_arch/features/home/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_arch/features/home/data/repository/article_repository_imp.dart';
import 'package:flutter_clean_arch/features/home/domain/repository/article_repository.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/get_articles.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/get_saved_articles.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/remove_article.dart';
import 'package:flutter_clean_arch/features/home/domain/usecases/save_article.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> initializeDependencies() async {
  //Database
  final database = await $FloorAppDatabase.databaseBuilder(app_database_name).build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));
  sl.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(sl(),sl(),sl()));
}
