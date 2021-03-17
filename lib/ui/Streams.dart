import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void StreamsDemo() async {
  var sub = generateStream().where((e) => e.isEven).listen((data) {
    print(data);
  });

  var i = await generateStreamByList().length;
  print(i);

  Future.delayed(Duration(milliseconds: 4100), () {
    sub.cancel(); //  отписка
  });
}

Stream<int> generateStreamByList() {
  return Stream.fromIterable(<int>[0, 1, 2, 3, 4, 5]);
}

Stream<int> generateStream() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

StreamController<int> controller = StreamController<int>();

Stream<int> generateStreamByController() {
  Future(
    () async {
      for (var i = 0; i < 10; i++) {
        await Future.delayed(
          Duration(seconds: 1),
        );
        controller.sink.add(i);
      }
    },
  );

  return controller.stream;
}

class Streams extends StatefulWidget {
  @override
  _StreamsState createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {
  var _colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.lime,
    Colors.indigo,
  ];

  var _colorController = StreamController<Color>();
  var _randomizer = Random();

  @override
  Widget build(BuildContext context) {
    //StreamsDemo();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream demo"),
      ),
      body: StreamBuilder<Color>(
        stream: _colorController.stream,
        builder: (_, snapshot) {
          return Center(
            child: AnimatedContainer(
              color: snapshot.data,
              duration: Duration(milliseconds: 100),
              child: snapshot.hasData ? SizedBox.expand() : Text("no data"),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: FloatingActionButton(
          onPressed: () {
            print("Data emited");
            _colorController.sink.add(
              _colors[_randomizer.nextInt(_colors.length)],
            );
          },
          child: Icon(Icons.swap_horiz),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _colorController.close();
  }
}
