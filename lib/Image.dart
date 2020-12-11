import 'package:flutter/material.dart';

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
      body: Image.asset(
        "assets/images/1.jpg",
        width: 300,
        height: 300,
      ),

      // Image(image: AssetImage("assets/images/1.jpg")),

      // Image.asset("assets/images/1.jpg"),

      // Image.network(
      // "https://million-wallpapers.ru/wallpapers/5/35/459875890313654/jaguar-xk-r-2012.jpg"),

      floatingActionButton: FloatingActionButton(
        child: Text("Add"),
        backgroundColor: Colors.white30,
      ),
      backgroundColor: Colors.white,
    ));
  }
}
