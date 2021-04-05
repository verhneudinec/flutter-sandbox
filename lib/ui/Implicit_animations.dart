///////////// AnimatedOpacity ////
// import 'package:flutter/material.dart';

// class ImplicitDemo extends StatefulWidget {
//   @override
//   _ImplicitDemoState createState() => _ImplicitDemoState();
// }

// class _ImplicitDemoState extends State<ImplicitDemo> {
//   double _opacity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           setState(() {
//             if (_opacity > 0) {
//               _opacity = 0;
//             } else {
//               _opacity = 1;
//             }
//           });
//         },
//         child: Center(
//           child: AnimatedOpacity(
//             opacity: _opacity,
//             duration: Duration(seconds: 1),
//             child: Container(
//               width: 300,
//               height: 300,
//               color: Colors.red[400],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

////////AnimatedContainer ////
// import 'dart:math';

// import 'package:flutter/material.dart';

// class ImplicitDemo extends StatefulWidget {
//   @override
//   _ImplicitDemoState createState() => _ImplicitDemoState();
// }

// class _ImplicitDemoState extends State<ImplicitDemo> {
//   double borderRadius;
//   double margin;
//   Color color;

//   @override
//   void initState() {
//     borderRadius = randomBorderRadius();
//     margin = randomMargin();
//     color = randomColor();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           setState(() {
//             borderRadius = randomBorderRadius();
//             margin = randomMargin();
//             color = randomColor();
//           });
//         },
//         child: Center(
//           child: AnimatedContainer(
//             duration: Duration(seconds: 1),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(borderRadius),
//               color: color,
//             ),
//             margin: EdgeInsets.all(margin),
//             width: 300,
//             height: 300,
//             curve: Curves.easeInOutBack,
//           ),
//         ),
//       ),
//     );
//   }

//   double randomBorderRadius() {
//     return Random().nextDouble() * 64;
//   }

//   double randomMargin() {
//     return Random().nextDouble() * 64;
//   }

//   Color randomColor() {
//     return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF) * 64);
//   }
// }

/// CrossFade ///
// import 'package:flutter/material.dart';

// class ImplicitDemo extends StatefulWidget {
//   @override
//   _ImplicitDemoState createState() => _ImplicitDemoState();
// }

// class _ImplicitDemoState extends State<ImplicitDemo> {
//   CrossFadeState crossFadeState = CrossFadeState.showFirst;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           setState(() {
//             if (crossFadeState == CrossFadeState.showFirst)
//               crossFadeState = CrossFadeState.showSecond;
//             else
//               crossFadeState = CrossFadeState.showFirst;
//           });
//         },
//         child: Center(
//           child: AnimatedCrossFade(
//             duration: Duration(seconds: 1),
//             firstChild: Container(
//               width: 200,
//               height: 300,
//               color: Colors.green[400],
//             ),
//             secondChild: Container(
//               width: 300,
//               height: 200,
//               color: Colors.red[300],
//             ),
//             crossFadeState: crossFadeState,
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Switcher ///
// import 'package:flutter/material.dart';

// class ImplicitDemo extends StatefulWidget {
//   @override
//   _ImplicitDemoState createState() => _ImplicitDemoState();
// }

// class _ImplicitDemoState extends State<ImplicitDemo> {
//   Widget child = Container(
//     key: UniqueKey(),
//     width: 200,
//     height: 300,
//     color: Colors.green[400],
//   );

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           setState(
//             () {
//               child = Container(
//                 key: UniqueKey(),
//                 width: 300,
//                 height: 200,
//                 color: Colors.red[300],
//               );
//             },
//           );
//         },
//         child: Center(
//           child: AnimatedSwitcher(
//             duration: Duration(seconds: 1),
//             child: child,
//             transitionBuilder: (child, animation) {
//               return ScaleTransition(
//                 scale: animation,
//                 child: child,
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

/// AnimatedPhysicalModel
import 'package:flutter/material.dart';

class ImplicitDemo extends StatefulWidget {
  @override
  _ImplicitDemoState createState() => _ImplicitDemoState();
}

class _ImplicitDemoState extends State<ImplicitDemo> {
  Widget child = Container(
    key: UniqueKey(),
    width: 200,
    height: 300,
    color: Colors.green[400],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(
            () {
              child = Container(
                key: UniqueKey(),
                width: 300,
                height: 200,
                color: Colors.red[300],
              );
            },
          );
        },
        child: Center(
          child: AnimatedPhysicalModel(
            elevation: 50,
            shadowColor: Colors.black,
            shape: BoxShape.rectangle,
            color: Colors.red,
            duration: Duration(seconds: 1),
            child: child,
          ),
        ),
      ),
    );
  }
}
