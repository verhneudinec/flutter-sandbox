import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_project/ui/Streams.dart';

class ErrorsExceptions extends StatefulWidget {
  @override
  _ErrorsExceptionsState createState() => _ErrorsExceptionsState();
}

class _ErrorsExceptionsState extends State<ErrorsExceptions> {
  void testException_1() {
    try {
      testThrow();
    } on FormatException catch (e) {
      print(e);
    } on MyException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    } finally {
      print("done.");
    }
  }

  Future<int> testException_2() async {
    try {
      await testAsyncThrow();
    } on FormatException catch (e) {
      print(e.toString() + " from testException_2");
    }
  }

  Stream<int> testAsyncThrowFromStream() async* {
    // async star
    throw FormatException();
  }

  var _controller = StreamController<String>.broadcast();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _controller.stream.listen(
      (event) {},
      onError: (e) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
            action: SnackBarAction(
              label: "Close",
              onPressed: () {
                _scaffoldKey.currentState.hideCurrentSnackBar();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    testException_1();

    testAsyncThrow().then((value) => print(value), onError: (e) {
      print(e);
    });

    testException_2();

    // testAsyncThrowFromStream().listen(
    //   (event) {},
    //   onError: (e) {
    //     print("got error from Stream");
    //   },
    // );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Errors handling"),
      ),
      body: Center(
        child: Container(
          child: StreamBuilder(
            stream: _controller.stream,
            initialData: 'Initial data',
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Icon(
                  Icons.error,
                  size: 45,
                );

              return Text(snapshot.data);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.sink.addError(MyException());
        },
        child: Icon(Icons.error),
      ),
    );
  }
}

void testThrow() {
  throw MyException(); //FormatException();
}

Future<int> testAsyncThrow() async {
  throw FormatException();
}

class MyException implements Exception {
  MyException();

  @override
  String toString() => 'smth wen wrong';
}
