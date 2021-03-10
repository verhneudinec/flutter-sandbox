import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getPosts() async {
  final postResponse =
      await http.get("https://jsonplaceholder.typicode.com/posts");

  if (postResponse.statusCode == 200) {
    return postResponse.body;
  }

  throw Exception("HTTP request error. Error code ${postResponse.statusCode}");
}

Future<String> createPost() async {
  final postResponse = await http.post(
    "https://jsonplaceholder.typicode.com/posts",
    body: jsonEncode({
      'title': 'Заголовок',
      'body': 'Тело поста',
      'userId': 1,
    }),
  );

  if (postResponse.statusCode == 201) {
    return postResponse.body;
  }

  throw Exception("HTTP request error. Error code ${postResponse.statusCode}");
}
