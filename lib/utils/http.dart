import 'package:dio/dio.dart';

class Http {
  Dio dio = Dio();
  final _options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);

  static final Http _singleton = Http._internal();

  factory Http() => _singleton;

  Http._internal();

  void init() {
    dio = Dio(_options);
    dio.interceptors.add(logger);
  }

  final InterceptorsWrapper logger = InterceptorsWrapper(
    onRequest: (options, handler) {
      print('-- REQUEST --');
      print('--> ${options.method} ${options.path} --');
      print('Content type:${options.contentType}');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print('-- REQUEST --');
      print('--> ${response.statusCode}');
      print(response.data);
      print('--- END RESPONSE --');
      return handler.next(response);
    },
    onError: (DioError e, handler) {
      print(e);
      return handler.next(e);
    },
  );
}
