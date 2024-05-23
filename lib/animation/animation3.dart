// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AnimatedAlignExample extends StatefulWidget {
//   const AnimatedAlignExample({super.key});
//
//   @override
//   State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
// }
//
// class _AnimatedAlignExampleState extends State<AnimatedAlignExample>
//     with TickerProviderStateMixin {
//   late AnimationController zoomController;
//   late Animation<double> zoomAnimation;
//
//   late Animation<double> widthAnimation;
//   late Animation<double> heightAnimation;
//   late Animation<double> opacityAnimation;
//   late Animation<double> textSizeAnimation;
//   late Animation<Color?> colorAnimation; // Declare color animation
//
//   late AnimationController animationController;
//   late double screenWidth;
//   late double screenHeight;
//   double yellowContainer = 130;
//   double textSize = 30.0;
//   late ImageProvider _backgroundImage;
//   bool showAnimatedBuilder = false; // Add a flag to control the visibility
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       setState(() {
//         selected = !selected;
//       });
//     });
//     zoomController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     zoomAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
//       CurvedAnimation(
//         parent: zoomController,
//         curve: Curves.easeInOut,
//       ),
//     );
//     zoomController.forward();
//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     textSizeAnimation = Tween<double>(begin: 30.0, end: 60.0).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Curves.easeInOut, // Adjust curve as needed
//       ),
//     );
//
//     // Initialize color animation
//     colorAnimation =
//         ColorTween(begin: Colors.yellow, end: Colors.white).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: const Interval(0.5, 0.6, curve: Curves.easeInOut),
//       ),
//     );
//
//     animationController.addListener(() {
//       setState(() {});
//     });
//
//     animationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           // Increase text size after animation completes
//           textSize = 60.0;
//         });
//         Future.delayed(const Duration(seconds: 1), () {
//           setState(() {
//             showAnimatedBuilder = true;
//           });
//           animationController.reverse();
//         });
//       } else if (status == AnimationStatus.dismissed) {
//         // setState(() {
//         //   textSize = 30;
//         // });
//         animationController.stop();
//       }
//     });
//     //start animation
//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() {
//         showAnimatedBuilder = true;
//       });
//       animationController.forward();
//     });
//
//     // Start the animations
//
//     // Initialize opacity animation
//     // opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//     //   CurvedAnimation(
//     //     parent: animationController,
//     //     curve: Interval(0.0, 0.5, curve: Curves.easeInOutCubicEmphasized), // Adjust timing
//     //   ),
//     // );
//     // _backgroundImage = AssetImage('assets/cyclist-riding-on-the-rocky-riverside-2023-11-27-05-18-53-utc.jpg');
//     // precacheImage(_backgroundImage, context);
//   }
//
//   @override
//   void dispose() {
//     zoomController.dispose();
//
//     animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//     double beginWidth =
//         MediaQuery.of(context).orientation == Orientation.portrait
//             ? 130.0
//             : 170.0;
//     double beginHeight =
//         MediaQuery.of(context).orientation == Orientation.portrait ? 40 : 50;
//
//     widthAnimation = Tween<double>(begin: beginWidth, end: screenWidth).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
//       ),
//     );
//
//     heightAnimation =
//         Tween<double>(begin: beginHeight, end: screenHeight).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 0.6, curve: Curves.easeInOut),
//       ),
//     );
//   }
//
//   bool selected = false;
//   bool textShown = false; // Flag to track whether the logo has been shown
//   // double calculateWidth() {
//   //   const String text =
//   //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do, consectetur adipiscing elit, sed do, consectetur adipiscing elit, sed do ';
//   //   final TextPainter textPainter = TextPainter(
//   //     text: TextSpan(text: text, style: TextStyle(fontSize: 20)),
//   //     maxLines: 1,
//   //     textDirection: TextDirection.ltr,
//   //   )..layout();
//   //   return textPainter.size.width;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     double fontSize = isPortrait ? 10.0 : 30.0;
//
//     return Center(
//       child: Stack(
//         children: [
//           ColorFiltered(
//             colorFilter: ColorFilter.mode(
//               Colors.black
//                   .withOpacity(0.4), // Adjust opacity and color to control dullness
//               BlendMode.darken,
//             ),
//             child: AnimatedBuilder(
//               animation: zoomController,
//               builder: (context, child) {
//                 return Transform.scale(
//                   scale: zoomAnimation.value,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/Noon bg.png'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Positioned(
//             // left: 50,
//             child: Center(
//               child: Container(
//                 // color: Colors.yellow,
//                 width: 400,
//                 height: 140,
//                 child: DefaultTextStyle(
//                     maxLines: 6,
//                     // softWrap: true,
//
//                     style: const TextStyle(
//                       fontFamily: 'Bobbers',
//                     ),
//                     child: AnimatedTextKit(
//                       totalRepeatCount: 1,
//
//
//                       animatedTexts: [
//                         RotateAnimatedText(
//                           transitionHeight: 1.0,
//                           // alignment: Alignment.center,
//                           // transitionHeight: 40.2,
//                           duration: Duration(seconds: 4),
//                           rotateOut: false,
//                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do, consectetur adipiscing elit, sed do, consectetur adipiscing elit, sed do ',
//                           textAlign: TextAlign.center,
//                           textStyle: TextStyle(fontSize: 25),
//                           // colors: [Colors.yellow, Colors.pink],
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//           ),
//           // Positioned(
//           //   top: 160,
//           //   left: 50,
//           //   child: DefaultTextStyle(
//           //       style:  TextStyle(
//           //         fontSize: 20,
//           //         fontFamily: 'Bobbers',
//           //       ),
//           //       child: AnimatedTextKit(
//           //         totalRepeatCount: 10,
//           //
//           //         animatedTexts: [
//           //
//           //
//           //           ScaleAnimatedText(
//           //             'Lorem ipsum  do ',
//           //             textAlign:
//           //             TextAlign.center,
//           //
//           //           ),
//           //         ],
//           //       )),),
//           Positioned(
//             top: isPortrait ? 240 : 75,
//             left: isPortrait ? 122 : 345,
//             child: DefaultTextStyle(
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'Bobbers',
//                 ),
//                 child: AnimatedTextKit(
//                   totalRepeatCount: 1,
//                   animatedTexts: [
//                     WavyAnimatedText(
//                       'Lorem ipsum  do ',
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 )),
//           ),
//
//           Positioned(
//             top: isPortrait ? 240 : 95,
//             left: isPortrait ? 122 : 345,
//             child: Container(
//               // height: 100,
//               // width: 400,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               color: Colors.transparent,
//               child: AnimatedAlign(
//                 alignment:
//                     selected ? Alignment.centerRight : Alignment.centerLeft,
//                 duration: const Duration(seconds: 5),
//                 curve: Curves.linear,
//                 onEnd: () {
//                   // Animation completes, show logo if it hasn't been shown yet
//                   if (!textShown) {
//                     setState(() {
//                       textShown = true;
//                     });
//                   }
//                 },
//                 child: textShown
//                     ? null
//                     : Text(
//                         'Dreams',
//                         style: TextStyle(fontSize: 40, color: Colors.white),
//                       ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  @override
  _AnimatedAlignExampleState createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  List<Widget> shapes = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          shapes.add(_generateRandomShape());
        });
      },
      child: Container(
        color: Colors.black,
        child: Stack(
          children: shapes,
        ),
      ),
    );
  }

  Widget _generateRandomShape() {
    var rng = Random();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var randomColor = Color.fromRGBO(
      rng.nextInt(256),
      rng.nextInt(256),
      rng.nextInt(256),
      1,
    );
    var randomLeft = rng.nextDouble() * screenWidth;
    var randomTop = rng.nextDouble() * screenHeight;
    var randomWidth = rng.nextDouble() * 100 + 50;
    var randomHeight = rng.nextDouble() * 100 + 50;

    switch (rng.nextInt(3)) {
      case 0:
        return Positioned(
          left: randomLeft,
          top: randomTop,
          child: Container(
            width: randomWidth,
            height: randomHeight,
            decoration: BoxDecoration(
              color: randomColor,
              shape: BoxShape.circle,
            ),
          ),
        );
      case 1:
        return Positioned(
          left: randomLeft,
          top: randomTop,
          child: Container(
            width: randomWidth,
            height: randomHeight,
            color: randomColor,
          ),
        );
      case 2:
        return Positioned(
          left: randomLeft,
          top: randomTop,
          child: Transform.rotate(
            angle: rng.nextDouble() * pi,
            child: Container(
              width: randomWidth,
              height: randomHeight,
              decoration: BoxDecoration(
                color: randomColor,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }
}