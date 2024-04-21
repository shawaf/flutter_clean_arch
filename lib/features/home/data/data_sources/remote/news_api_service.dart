import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/constants/constants.dart';
import 'package:flutter_clean_arch/features/home/data/models/article_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey ,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
