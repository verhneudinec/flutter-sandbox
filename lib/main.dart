import 'package:flutter/material.dart';
import 'package:study_project/Advanced_tab.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  final String title = "My flutter app";

  @override
  State<StatefulWidget> createState() {
    return AdvancedTab();
  }
}
