import 'package:dio/dio.dart';

final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: "https://jsonplaceholder.typicode.com",
  connectTimeout: 10000,
  receiveTimeout: 10000,
  sendTimeout: 10000,
  responseType: ResponseType.json,
  headers: {
    "device-Info": "TruePhone OS 15",
  },
);

Future<dynamic> getPosts() async {
  initInterceptors();
  final postResponse = await dio.get(
    "/posts",
    queryParameters: {
      'id': 1,
    },
  );

  // For POST
  // final postRequest = await dio.post(
  //   "/posts",
  //   data: {
  //     'id': 1,
  //   },
  // );

  if (postResponse.statusCode == 200) {
    return postResponse.data;
  }

  throw Exception("HTTP request error. Error code ${postResponse.statusCode}");
}

void initInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e) {},
      onRequest: (options) {
        print("Запрос отправляется");
      },
      onResponse: (e) {
        print(e.toString());
        print("Ответ получен");
      },
    ),
  );
}
