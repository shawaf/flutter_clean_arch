import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/constants/constants.dart';
import 'package:flutter_clean_arch/core/resources/api_result.dart';
import 'package:flutter_clean_arch/features/home/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_arch/features/home/data/models/article_model.dart';
import 'package:flutter_clean_arch/features/home/domain/entities/article.dart';
import 'package:flutter_clean_arch/features/home/domain/repository/article_repository.dart';

import '../data_sources/local/app_database.dart';

class ArticleRepositoryImp extends ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImp(this._newsApiService, this._appDatabase);

  @override
  Future<APIResult<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiToken,
        country: queryCountry,
        category: queryCategory,
      );
      print("API Failure : ${httpResponse.data}");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Success(httpResponse.data);
      } else {
        return Failure(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      print("API Failure : $e");
      return Failure(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity articleEntity) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(articleEntity));
  }

  @override
  Future<void> saveArticle(ArticleEntity articleEntity) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(articleEntity));
  }
}
