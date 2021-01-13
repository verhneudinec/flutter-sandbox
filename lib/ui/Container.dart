import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  final String title = "My flutter app";

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: 100,
        ),
        color: Colors.yellow,
        padding: EdgeInsets.all(3),
        child: Container(
          transform: Matrix4.rotationZ(0.4),
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(30),
          width: 50,
          height: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}

class UN extends StatelessWidget {
  const UN({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 600),
        child: Container(
          color: Colors.yellow,
          height: 100,
          width: 100,
          constraints: BoxConstraints(
            minHeight: 200,
            maxHeight: 300,
          ),
        ),
      ),
    );
  }
}
