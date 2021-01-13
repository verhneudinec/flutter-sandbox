import 'package:flutter/material.dart';
import 'package:study_project/ui/Advanced_tab.dart';
import 'package:study_project/res/themes.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title of app",
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My test app"),
        ),
        body: Column(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "test 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face_outlined),
              label: "test 2",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dangerous),
              label: "test 3",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Text(
              isDarkMode ? "to light" : "to Dark",
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            }),
      ),
    );
  }
}
