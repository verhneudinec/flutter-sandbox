import 'package:flutter/material.dart';

class CustomNestedScrollView extends StatefulWidget {
  const CustomNestedScrollView({Key key}) : super(key: key);

  @override
  _CustomNestedScrollViewState createState() => _CustomNestedScrollViewState();
}

class _CustomNestedScrollViewState extends State<CustomNestedScrollView> {
  final List<String> _titles = ["one", "two", "three"];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: _titles.length,
          child: OverScrollGlowAbsorver(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: const Text("Sliver app bar"),
                    pinned: true,
                    expandedHeight: 150,
                    bottom: TabBar(
                      tabs: _titles
                          .map(
                            (String item) => Tab(
                              text: item,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  for (String item in _titles)
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _scrollController.animateTo(
                              1000,
                              duration: Duration(seconds: 1),
                              curve: Curves.linear,
                            );
                          },
                          child: Text("Вниз"),
                        ),
                        Flexible(
                          child: CustomScrollView(
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text("Item $index"),
                                    );
                                  },
                                  childCount: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OverScrollGlowAbsorver extends StatelessWidget {
  final Widget child;

  OverScrollGlowAbsorver({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: child,
      onNotification: (notification) {
        if (notification is OverscrollIndicatorNotification) {
          notification.disallowGlow();
          // не показывать свечение
        }
        return false;
      },
    );
  }
}
