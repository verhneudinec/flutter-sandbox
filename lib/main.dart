import 'package:flutter/material.dart';
import 'package:study_project/res/themes.dart';
import 'package:study_project/ui/Adapting_widgets.dart';
import 'package:study_project/ui/BottomSheet_Dialog.dart';
import 'package:study_project/ui/Dio_demo.dart';
import 'package:study_project/ui/Errors_Exceptions.dart';
import 'package:study_project/ui/Explicit_animations.dart';
import 'package:study_project/ui/Hero_animations.dart';
import 'package:study_project/ui/Http_demo.dart';
import 'package:study_project/ui/Implicit_animations.dart';
import 'package:study_project/ui/Navigator.dart';
import 'package:study_project/ui/Pickers.dart';
import 'package:study_project/ui/Plugins.dart';
import 'package:study_project/ui/Shared_prefs.dart';
import 'package:study_project/ui/Streams.dart';

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
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? darkTheme : lightTheme,
      home: PluginsDemo(),
      // routes: {
      //   '1': (context) => AppNavigator2(),
      // },
    );
  }
}
