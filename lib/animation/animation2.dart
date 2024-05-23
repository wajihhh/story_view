// import 'package:flutter/material.dart';
//
// import '../text.dart';
//
// class AnimationTest2 extends StatefulWidget {
//   const AnimationTest2({Key? key}) : super(key: key);
//
//   @override
//   State<AnimationTest2> createState() => _AnimationTest2State();
// }
//
// class _AnimationTest2State extends State<AnimationTest2>
//     with SingleTickerProviderStateMixin {
//   late AnimationController zoomController;
//   late Animation<double> zoomAnimation;
//   late Animation<double> widthAnimation;
//   late Animation<double> heightAnimation;
//   late Animation<double> opacityAnimation;
//   late Animation<double> textSizeAnimation;
//   late Animation<Color?> colorAnimation; // New animation for color change
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
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     textSizeAnimation = Tween<double>(begin: 30.0, end: 60.0).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Curves.easeInOut, // Adjust curve as needed
//       ),
//     );
//
//     colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.white) // Define color change tween
//         .animate(CurvedAnimation(
//       parent: animationController,
//       curve: Interval(0.2, 1.0, curve: Curves.easeInOut), // Delay the color change
//     ));
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
//         Future.delayed(Duration(seconds: 1), () {
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
//     Future.delayed(Duration(seconds: 1), () {
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
//     MediaQuery.of(context).orientation == Orientation.portrait ? 130.0 : 170.0;
//     double beginHeight =
//     MediaQuery.of(context).orientation == Orientation.portrait ? 40 : 50;
//
//     widthAnimation = Tween<double>(begin: beginWidth, end: screenWidth).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
//       ),
//     );
//
//     heightAnimation = Tween<double>(begin: beginHeight, end: screenHeight).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 0.6, curve: Curves.easeInOut),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//     double fontSize = isPortrait ? 25.0 : 40.0;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Slide in the background image
//           Positioned(
//             // right: screenWidth -
//             //     (widthAnimation.value * animationController.value *5),
//             child: Container(
//               width: screenWidth,
//               height: screenHeight,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/morning.png'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: isPortrait ? 385 : 165,
//             left: isPortrait ? 4 : 110,
//             child: DefaultTextStyle(
//               style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 // color: colorAnimation.value, // Apply color change
//                 fontFamily: 'Poppins',
//               ),
//               child: TypewriterText(
//                 text: "And There Will ",
//                 duration: Duration(milliseconds: 1000),
//                 // style: TextStyle(fontSize: textSize),
//               ),
//             ),
//           ),
//           if (showAnimatedBuilder)
//             Positioned(
//               top: isPortrait ? 385 : 295,
//               left: isPortrait ? 4 : 60,
//               child: AnimatedBuilder(
//                 animation: animationController,
//                 builder: (context, child) {
//                   return Container(
//                     color: Colors.transparent,
//                     // width: widthAnimation.value,
//                     // height: heightAnimation.value,
//                     child: Center(
//                       child: Text(
//                         "A Day",
//                         style: TextStyle(
//                           color: colorAnimation.value,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w900,
//                           fontSize: animationController.status == AnimationStatus.reverse
//                               ? textSizeAnimation.value
//                               : fontSize, // Apply text size
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           if (showAnimatedBuilder)
//             Positioned(
//               top: isPortrait ? 385 : 35,
//               left: isPortrait ? 4 : 650,
//               child: AnimatedBuilder(
//                 animation: animationController,
//                 builder: (context, child) {
//                   return Container(
//                     color: Colors.transparent,
//                     // width: widthAnimation.value,
//                     // height: heightAnimation.value,
//                     child: Center(
//                       child: Text(
//                         "A Day",
//                         style: TextStyle(
//                           color: colorAnimation.value,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w900,
//                           fontSize: animationController.status == AnimationStatus.reverse
//                               ? textSizeAnimation.value
//                               : fontSize, // Apply text size
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           if (showAnimatedBuilder)
//             Positioned(
//               top: isPortrait ? 385 : 165,
//               left: isPortrait ? 4 : 410,
//               child: AnimatedBuilder(
//                 animation: animationController,
//                 builder: (context, child) {
//                   return Container(
//                     color: Colors.transparent,
//                     // width: widthAnimation.value,
//                     // height: heightAnimation.value,
//                     child: Center(
//                       child: Text(
//                         "A Day",
//                         style: TextStyle(
//                           color: colorAnimation.value,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w900,
//                           fontSize: animationController.status == AnimationStatus.reverse
//                               ? textSizeAnimation.value
//                               : fontSize, // Apply text size
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text.dart';

class AnimationTest2 extends StatefulWidget {
  const AnimationTest2({Key? key}) : super(key: key);

  @override
  State<AnimationTest2> createState() => _AnimationTest2State();
}

class _AnimationTest2State extends State<AnimationTest2>
    with TickerProviderStateMixin {
  late AnimationController zoomController;
  late Animation<double> zoomAnimation;

  late Animation<double> widthAnimation;
  late Animation<double> heightAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> textSizeAnimation;
  late Animation<Color?> colorAnimation; // Declare color animation

  late AnimationController animationController;
  late double screenWidth;
  late double screenHeight;
  double yellowContainer = 130;
  double textSize = 30.0;
  late ImageProvider _backgroundImage;
  bool showAnimatedBuilder = false; // Add a flag to control the visibility

  @override
  void initState() {
    super.initState();
    zoomController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    zoomAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: zoomController,
        curve: Curves.easeInOut,
      ),
    );
    zoomController.forward();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    textSizeAnimation = Tween<double>(begin: 30.0, end: 60.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut, // Adjust curve as needed
      ),
    );

    // Initialize color animation
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.white).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.6, curve: Curves.easeInOut),
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          // Increase text size after animation completes
          textSize = 60.0;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            showAnimatedBuilder = true;
          });
          animationController.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        // setState(() {
        //   textSize = 30;
        // });
        animationController.stop();
      }
    });
    //start animation
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showAnimatedBuilder = true;
      });
      animationController.forward();
    });

    // Start the animations

    // Initialize opacity animation
    // opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: animationController,
    //     curve: Interval(0.0, 0.5, curve: Curves.easeInOutCubicEmphasized), // Adjust timing
    //   ),
    // );
    // _backgroundImage = AssetImage('assets/cyclist-riding-on-the-rocky-riverside-2023-11-27-05-18-53-utc.jpg');
    // precacheImage(_backgroundImage, context);
  }

  @override
  void dispose() {
    zoomController.dispose();

    animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    double beginWidth =
        MediaQuery.of(context).orientation == Orientation.portrait
            ? 130.0
            : 170.0;
    double beginHeight =
        MediaQuery.of(context).orientation == Orientation.portrait ? 40 : 50;

    widthAnimation = Tween<double>(begin: beginWidth, end: screenWidth).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
      ),
    );

    heightAnimation =
        Tween<double>(begin: beginHeight, end: screenHeight).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.6, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double fontSize = isPortrait ? 25.0 : 40.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          AnimatedBuilder(
            animation: zoomController,
            builder: (context, child) {
              return Transform.scale(
                scale: zoomAnimation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Noon bg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: isPortrait ? 435 : 175,
            left: isPortrait ? 8 : 120,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
              child: TypewriterText(
                text: "And There Will",
                duration: Duration(milliseconds: 1000),
                // style: TextStyle(fontSize: textSize),
              ),
            ),
          ),
          if (showAnimatedBuilder)
            Positioned(
              top: isPortrait ? 755 : 55,
              left: isPortrait ? 28 : 691,
              child: Text(
                "A Day",
                style: TextStyle(
                  fontFamily: 'Poppins',

                  fontWeight: FontWeight.w900,
                  fontSize:
                      animationController.status == AnimationStatus.reverse
                          ? textSizeAnimation.value
                          : fontSize, // Apply text size
                  color: colorAnimation.value, // Apply color
                ),
              ),
            ),
          if (showAnimatedBuilder)
            Positioned(
              top: isPortrait ? 435 : 175,
              left: isPortrait ? 198 : 421,
              child: Text(
                "A Day",
                style: TextStyle(
                  fontFamily: 'Poppins',

                  fontWeight: FontWeight.w900,
                  fontSize:
                      animationController.status == AnimationStatus.reverse
                          ? textSizeAnimation.value
                          : fontSize, // Apply text size
                  color: colorAnimation.value, // Apply color
                ),
              ),
            ),
          if (showAnimatedBuilder)
            Positioned(
              top: isPortrait ? 155 : 325,
              left: isPortrait ? 298 : 21,
              child: Text(
                "A Day",
                style: TextStyle(
                  fontFamily: 'Poppins',

                  fontWeight: FontWeight.w900,
                  fontSize:
                      animationController.status == AnimationStatus.reverse
                          ? textSizeAnimation.value
                          : fontSize, // Apply text size
                  color: colorAnimation.value, // Apply color
                ),
              ),
            ),
        ],
      ),
    );
  }
}
