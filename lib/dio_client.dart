import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_client.g.dart';

@riverpod
Dio buildDioClient(BuildDioClientRef ref) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);

  dio.interceptors.addAll([]);

  return dio;
}

const String baseUrl = 'kdfjiefejfef';
