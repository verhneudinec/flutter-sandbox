import 'package:flutter/material.dart';

class CustomScrollView_SliverList_SliverAppBar extends StatefulWidget {
  CustomScrollView_SliverList_SliverAppBar({Key key}) : super(key: key);

  @override
  _CustomScrollView_SliverList_SliverAppBarState createState() =>
      _CustomScrollView_SliverList_SliverAppBarState();
}

class _CustomScrollView_SliverList_SliverAppBarState
    extends State<CustomScrollView_SliverList_SliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Test slivers",
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    for (int i = 0; i < 2; i++)
                      Container(
                        height: 200,
                        color:
                            i % 2 == 0 ? Colors.green[700] : Colors.green[300],
                      )
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: StickyHeaderDelegate(),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    for (int i = 0; i < 5; i++)
                      Container(
                        height: 200,
                        color:
                            i % 2 == 0 ? Colors.green[700] : Colors.green[300],
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("StickyHeader"),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
