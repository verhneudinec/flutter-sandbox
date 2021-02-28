import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('1', arguments: 3);
              //// Для неименованного роутинга ///
              // Navigator.of(context).push(
              //   CupertinoPageRoute(
              //     builder: (context) {
              //       return SecondWidget(1);
              //     },
              //     settings: RouteSettings(name: "/Page2"),
              //   ),
              // );
            },
            child: Text("Push"),
          ),
        ),
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  final int value;
  const SecondWidget(this.value, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _routeData = ModalRoute.of(context).settings.arguments as int;
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return ThirdWidget();
                  },
                  settings: RouteSettings(name: "/Page3"),
                ),
              );
            },
            child: Text("Push page 3"),
          ),
          const SizedBox(
            width: 20,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Pop $_routeData"),
          ),
        ],
      ),
    );
  }
}

class ThirdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return ForthWidget();
                  },
                  settings: RouteSettings(name: "/Page4"),
                ),
              );
            },
            child: Text("Push /Page4"),
          ),
          const SizedBox(
            width: 20,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (context) {
                    return ForthWidget();
                  },
                  settings: RouteSettings(name: "/Page4"),
                ),
              );
            },
            child: Text("Push replacement"),
          ),
          const SizedBox(
            width: 20,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                /// PageRoute с кастомной анимацией
                PageRouteBuilder(
                  pageBuilder: (context, animation, socondaryAnimation) {
                    var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var tween = Tween(begin: begin, end: end);
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: ForthWidget(),
                    );
                  },
                  settings: RouteSettings(name: "/Page4"),
                ),
              );
            },
            child: Text("PageRouteBuilder"),
          ),
        ],
      ),
    );
  }
}

class ForthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context)
                .popUntil((route) => route.settings.name == "/Page3");
          },
          child: Text("Pop to 3 page"),
        ),
      ),
    );
  }
}
