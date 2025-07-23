import 'package:dio/dio.dart';

class NewsService {
  final Dio _dio = Dio();
  NewsService() {
    // _dio.options.baseUrl = 'https://api.thenewsapi.com/v1/';
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
  }
  Future<Response> fetchTopNews() async {
    try {
      final Response response = await _dio.get(
        '/news/top',
        queryParameters: {
          'api_token': 'WNmPQDu5QmKZ08X045JfSvCzyIY3wVhw8JcqMix4',
          'locale': 'us',
          'limit': 3,
        },
      );
      return response;
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }

  Future<Response> fetchAllNews() async {
    try {
      final Response response = await _dio.get(
        '/news/all',
        queryParameters: {
          'api_token': 'WNmPQDu5QmKZ08X045JfSvCzyIY3wVhw8JcqMix4',
          'language': 'en',
          'limit': 3,
        },
      );
      return response;
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }

  Future<Response> fetchData(
    String endUrl,
    Map<String, dynamic> queryParams,
  ) async {
    try {
      final Response response = await _dio.get(
        endUrl,
        queryParameters: queryParams,
      );
      return response;
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }

  Future<Response> postMethod(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      throw Exception("Error posting news: $e");
    }
  }
}
