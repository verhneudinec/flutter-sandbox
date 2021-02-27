import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

/// Первый пример
class LearningFuture extends StatelessWidget {
  const LearningFuture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Response>(
          // FutureBuilder<Response>
          future: get(
              "https://f.vividscreen.info/soft/99b6173abe15f7df0cc6b78499a9f4e7/United-States-Nebraska-Storm-2880x1920.jpg"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("error #1");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Image.memory(snapshot.data.bodyBytes);
              } else {
                return Text("error #2");
              }
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/// Второй пример
class LearningFuture2 extends StatelessWidget {
  const LearningFuture2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _learningFuture() {
      Future.delayed(Duration(seconds: 5), () => print("test"));
      Future.delayed(Duration(seconds: 1), () => "test 2")
          .then((value) => print(value));
      Future.delayed(
        Duration(seconds: 3),
        () => Future.error("error1"),
      ).then(
        (res) => print(res),
        onError: (error) => print('got error $error'),
      );
    }

    _learningFuture();
    testAsyncFunction();

    return Scaffold(
      body: Center(child: Text("Изучение Future")),
    );
  }
}

void testAsyncFunction() async {
  try {
    var res = await getMessage();
    print(res);
  } catch (e) {
    print(e);
  }
}

Future<String> getMessage() {
  return Future.delayed(
    Duration(seconds: 1),
    () => Future.error("error #1"),
  );
}

/// Completer
void asyncWorker() async {
  var res = await AsyncWorker().start();
  print(res);
}

class AsyncWorker {
  var _completer = Completer<String>();
  Future<String> start() {
    _startSmth();
    return _completer.future;
  }

  Future<void> _startSmth() async {
    try {
      var res = await _doAsync();
      _finish(await _oneMoreAsync(res));
    } catch (e) {
      print(e);
    }
  }

  Future<String> _doAsync() async {
    return Future.delayed(Duration(seconds: 1), () {
      print('doAsync complete');
      return "one";
    });
  }

  Future<String> _oneMoreAsync(String info) async {
    return Future.delayed(Duration(seconds: 1), () {
      print('doAsync complete');
      return "$info two";
    });
  }

  void _finish(String res) {
    _completer.complete(res);
  }
}

/// Четвертый пример
void asyncWorker2() async {
  m1();
  m2();
}

void m1() {
  print('Start m1');

  var list = <String>['one', 'two', 'three'];
  list.forEach((value) async {
    await delayedPrint(value);
  });

  // В отдельном потоке отрабатывает перебор
  // каждого из элементов

  print('End m1');
}

void m2() async {
  print('Start m2');

  var list = <String>['one', 'two', 'three'];
  for (var i = 0; i < list.length; i++) {
    await delayedPrint(list[i] + ' from m2');
  }

  // в основном потоке
  // не просто перебираем,
  // а говорим ждать выполнения этой Future

  print('End m2');
}

Future<void> delayedPrint(String val) async {
  await Future.delayed(Duration(seconds: 1), () => print(val));
}
