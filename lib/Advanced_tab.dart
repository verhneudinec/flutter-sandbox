import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedTab extends State with SingleTickerProviderStateMixin {
  TabController tabController;

  // тикер - своего рода секундомер, который сообщает каждому классу о
  // том, что перерисовался очередной кадр анимации
  // нужно для анимации

  @override
  void initState() {
    //вызывается единожды при создании State
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of app"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: CustomTabIndicator(
            tabController: tabController,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text("tab 1 content")),
          Center(child: Text("tab 2 content")),
          Center(child: Text("tab 2 content")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        currentIndex: tabController.index,
        onTap: (currentIndex) {
          tabController.animateTo(currentIndex);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("111")),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment), title: Text("111")),
          BottomNavigationBarItem(icon: Icon(Icons.delete), title: Text("111")),
        ],
      ),
    );
  }
}

class CustomTabIndicator extends StatelessWidget {
  TabController tabController;
  CustomTabIndicator({
    Key key,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < tabController.length; i++)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tabController.index == i ? Colors.red : Colors.grey,
              ),
              width: 15,
              height: 15,
            ),
          )
      ],
    );
  }
}
