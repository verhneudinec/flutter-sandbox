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
              preferredSize: Size.fromHeight(50))),
      body: Center(
        child: Text("Кнопка нажата $_counter раз",
            style: Theme.of(context).textTheme.headline5),
      ),
      drawer: Container(
          color: Colors.green,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                child: Text("Drawer header"),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text("item #1"),
                onTap: _incrementCounter,
              ),
              ListTile(
                title: Text("item #2"),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text("Messages")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile"))
        ],
      ),
    ));
  }
}
