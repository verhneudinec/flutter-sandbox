import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2, // количество табов в TabBarView
      initialIndex: 1, // стартовый индекс
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title of app"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "tab 1",
              ),
              Tab(
                text: "tab 2",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("tab 1 content")),
            Center(child: Text("tab 2 content")),
          ],
        ),
      ),
    );
  }
}
