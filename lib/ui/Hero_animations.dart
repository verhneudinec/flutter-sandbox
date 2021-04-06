import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator2 extends StatelessWidget {
  const AppNavigator2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Hero(
                  tag: "image",
                  placeholderBuilder: (context, heroSize, child) {
                    return Opacity(
                      opacity: 0.5,
                      child: child,
                    );
                  },
                  flightShuttleBuilder: (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    final Hero toHero = toHeroContext.widget;

                    return ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.0, // изначальный размер
                        end: 1.0,
                      ).animate(animation),
                      child: toHero,
                    );
                  },
                  child: Image.network(
                    "https://cnet4.cbsistatic.com/img/wOFhmkKJ7xhJByXDb6mDyip9O0s=/1200x675/2020/06/11/03bf034d-1439-4d6a-bd4a-cd6e6ae26ee1/gettyimages-1145422609.jpg",
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  // Для неименованного роутинга ///
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return SecondWidget(1);
                      },
                      //  transitionDuration: Duration(seconds: 1),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // return SlideTransition(
                        //   position: Tween<Offset>(
                        //     begin: Offset(1, 0),
                        //     end: Offset.zero,
                        //   ).animate(animation),
                        //   child: child,
                        // );

                        // return RotationTransition(
                        //   turns: Tween<double>(
                        //     begin: 0.0,
                        //     end: 1.0,
                        //   ).animate(animation),
                        //   child: child,
                        // );
                        //

                        /// Scale transition. Отвечает за изменение размера экрана при переходе
                        // return ScaleTransition(
                        //   scale: Tween<double>(
                        //     begin: 0.0, // изначальный размер
                        //     end: 0.7,
                        //   ).animate(animation),
                        //   child: child, /// child можно заворачивать в еще один transition
                        // );
                        //
                        //

                        /// Комбинация ///
                        // return ScaleTransition(
                        //   scale: Tween<double>(
                        //     begin: 0.0, // изначальный размер
                        //     end: 1,
                        //   ).animate(animation),
                        //   child: RotationTransition(
                        //     turns: Tween<double>(
                        //       begin: 0.0, // изначальный размер
                        //       end: 1,
                        //     ).animate(animation),
                        //     child: child,
                        //   ),
                        // );
                        //
                        //

                        // Fade transition.
                        return FadeTransition(
                          opacity: Tween<double>(
                            begin: 0.0, // изначальный размер
                            end: 1.0,
                          ).animate(animation),
                          child: child,
                        );

                        //
                      },
                      settings: RouteSettings(name: "/Page2"),
                    ),
                  );
                },
                child: Text("Push to page 2"),
              ),
            ],
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Hero(
              tag: "image",
              child: Image.network(
                "https://cnet4.cbsistatic.com/img/wOFhmkKJ7xhJByXDb6mDyip9O0s=/1200x675/2020/06/11/03bf034d-1439-4d6a-bd4a-cd6e6ae26ee1/gettyimages-1145422609.jpg",
              ),
            ),
          ),
          Container(
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
          Image.network(
            "https://cnet4.cbsistatic.com/img/wOFhmkKJ7xhJByXDb6mDyip9O0s=/1200x675/2020/06/11/03bf034d-1439-4d6a-bd4a-cd6e6ae26ee1/gettyimages-1145422609.jpg",
          ),
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
