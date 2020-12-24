import 'package:flutter/material.dart';

void main() => runApp(AppStackWidget());

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  final String title = "My flutter app";

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
          ),
          flex: 9,
        ),
        Expanded(
            child: Container(
              color: Colors.red,
            ),
            flex: 1),
      ],
    );
  }
}

class AppStackWidget extends StatefulWidget {
  AppStackWidget({Key key}) : super(key: key);

  @override
  _AppStackWidgetState createState() => _AppStackWidgetState();
}

class _AppStackWidgetState extends State<AppStackWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            color: Colors.yellow,
            width: 201,
            height: 101,
          ),
          Container(
            color: Colors.red,
            width: 150,
            height: 300,
          ),
          Container(
            color: Colors.blue,
            width: 110,
            height: 200,
          ),
          Container(
            color: Colors.green,
            width: 201,
            height: 101,
          ),
        ],
      ),
    );
  }
}
