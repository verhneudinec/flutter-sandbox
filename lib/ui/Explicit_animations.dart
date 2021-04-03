import 'package:flutter/material.dart';

class ExplicitAnimationsDemo extends StatefulWidget {
  @override
  _ExplicitAnimationsDemoState createState() => _ExplicitAnimationsDemoState();
}

class _ExplicitAnimationsDemoState extends State<ExplicitAnimationsDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  Animation<double> _movingAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: .1,
      upperBound: .9,
      duration: Duration(seconds: 1),
    );

    // 1. _animationController.addListener(() {
    //   setState(() {});
    // });
    //
    // 2. StreamController
    // 3. AnimatedBuilder

    // _animationController.forward();

    _animationController.repeat(reverse: true, max: 0.9);

    _sizeAnimation = Tween<double>(begin: 200, end: 300).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    _movingAnimation = Tween<double>(begin: -100, end: 100).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                //  _animationController.stop();
                _animationController.reset();
                _animationController.forward();
              },
              child: Transform.translate(
                offset: Offset(_movingAnimation.value, 0),
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  color: Colors.red,
                  child: child,
                ),
              ),
            );
          },
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: Colors.green[200],
          ),
        ),
      ),
    );
  }
}
