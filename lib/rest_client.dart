import 'package:dio/dio.dart';
import 'package:dio_test/dio_client.dart';
import 'package:dio_test/model/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('/top-headlines')
  Future<HttpResponse<List<Article>>> getNewsArticles(
      {@Query('apiKey') String? apiKey});
}

@riverpod
RestClient apiService(ApiServiceRef ref) {
  final dioClient = ref.watch(buildDioClientProvider);
  return RestClient(dioClient);
}
