import 'package:flutter/material.dart';
import 'package:study_project/res/themes.dart';
import 'package:study_project/ui/BottomSheet_Dialog.dart';
import 'package:study_project/ui/Navigator.dart';

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
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test app",
      theme: isDarkMode ? darkTheme : lightTheme,
      home: BottomSheetAndDialog(),
      routes: {
        '1': (context) => SecondWidget(2),
      },
    );
  }
}
