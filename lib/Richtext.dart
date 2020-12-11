import 'package:flutter/material.dart';

// working with RichText & Text widgets

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter test"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: RichText(
          text: TextSpan(
              text: "Test text",
              style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  letterSpacing: 3.0,
                  color: Colors.black54,
                  fontFamily: "Nunito"),
              children: <TextSpan>[
            TextSpan(
              text: "hello",
              style: TextStyle(
                  fontSize: 33,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  letterSpacing: 3.0,
                  color: Colors.blue[900],
                  fontFamily: "Nunito"),
            ),
            TextSpan(
              text: "world",
              style: TextStyle(
                  fontSize: 66,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  letterSpacing: 3.0,
                  color: Colors.red[900],
                  fontFamily: "Nunito"),
            ),
            TextSpan(text: "!"),
          ])),
      // body: Text(
      //   "Hello, world",
      //   style: TextStyle(
      //       fontSize: 13,
      //       fontStyle: FontStyle.italic,
      //       fontWeight: FontWeight.bold,
      //       decoration: TextDecoration.underline,
      //       letterSpacing: 3.0,
      //       color: Colors.black54,
      //       fontFamily: "Nunito"),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Text("Add"),
        backgroundColor: Colors.white30,
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavigationBar(
      //   items: ["a","s"],
      // ),
    ));
  }
}
