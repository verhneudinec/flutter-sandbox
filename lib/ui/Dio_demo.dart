import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:study_project/http/dio_demo.dart';
import 'package:study_project/model/post.dart';

class DioDemo extends StatefulWidget {
  DioDemo({Key key}) : super(key: key);

  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  @override
  void initState() {
    testNetworkCall();
    super.initState();
  }

  Future<void> testNetworkCall() async {
    final response = await getPosts();

    print("${response.runtimeType} Response HTTP call = $response ");

    //final postList = parsePost(response);

    //print("${postList.runtimeType} postList = $postList");
  }

  List<Post> parsePost(String rawJson) {
    List postListJson = jsonDecode(rawJson);
    return postListJson.map((postJson) => Post.fromJson(postJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dio demo"),
      ),
    );
  }
}
