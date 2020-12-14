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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(icon: Icon(Icons.alarm), onPressed: _incrementCounter)
          ],
          bottom: PreferredSize(
              child: Text("Bottom of AppBar"),
              preferredSize: Size.fromHeight(50)),
        ),
        body: Center(
          child: Container(
            color: Colors.black12,
            width: double.infinity,
            height: 50,
            // работа с Text
            //     child: Text(
            //       "very long text very long text very long text very long text very long text ",
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(
            //         fontSize: 20,
            //         color: Colors.blue,
            //         decoration: TextDecoration.underline,
            //         decorationColor: Colors.red,
            //         decorationThickness: 5, // толщина decoration
            //         letterSpacing: 5, // межбуквенные интервалы
            //         wordSpacing: 5,
            //       ),
            //     ),
            // ----------------------------------
            // работа с RichText
            child: RichText(
              textAlign: TextAlign.center,
              maxLines: 1,
              text: TextSpan(
                  text: "Green, ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationThickness: 5, // толщина decoration
                    letterSpacing: 5, // межбуквенные интервалы
                    wordSpacing: 5,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: "blue ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                        text: "and red",
                        style: TextStyle(
                          color: Colors.red,
                          decorationColor: Colors.black,
                          fontSize: 40,
                        ),
                        children: [
                          TextSpan(
                            text: "!",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ]),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
