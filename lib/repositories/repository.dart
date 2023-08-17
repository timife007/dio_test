import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio_test/repositories/state.dart';
import 'package:dio_test/rest_client.dart';

import '../model/article.dart';

part 'repository.g.dart';

class NewsRepository {
  final RestClient _restClient;
  NewsRepository(this._restClient);
  final container = ProviderContainer();
  Future<DataState<List<Article>>> fetchArticles() async {
      final client = container.read(apiServiceProvider);
    final httpResponse =
        await _restClient.getNewsArticles(apiKey: 'hfehfuehfek');
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

@riverpod
NewsRepository getNewsRepo(GetNewsRepoRef ref) {
  final restClient = ref.watch(apiServiceProvider);
  return NewsRepository(restClient);
}
