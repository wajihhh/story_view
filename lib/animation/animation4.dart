import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text.dart';

class FourthConcept extends StatefulWidget {
  const FourthConcept({Key? key}) : super(key: key);

  @override
  State<FourthConcept> createState() => _FourthConceptState();
}

class _FourthConceptState extends State<FourthConcept>
    with TickerProviderStateMixin {
  // late AnimationController zoomController;
  // late Animation<double> zoomAnimation;
  late AnimationController zoomController;
  late Animation<double> zoomAnimation;
  late Animation<double> widthAnimation;
  late Animation<double> heightAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> textSizeAnimation;

// New animation for opacity
  late AnimationController slideController;
  late Animation<Offset> slideAnimation;
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
      duration: Duration(seconds: 7),
    );
    zoomAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(
        parent: zoomController,
        curve: Curves.decelerate,
      ),
    );
    slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: slideController,
        curve: Curves.easeInOut,
      ),
    );
    slideController.forward().then((_) {
      // Start zoom animation after slide animation completes
      zoomController.forward();
    });
    // zoomController.forward();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    textSizeAnimation = Tween<double>(begin: 30.0, end: 60.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut, // Adjust curve as needed
      ),);

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
    slideController.dispose();


    animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    double beginWidth = MediaQuery.of(context).orientation == Orientation.portrait ? 270.0 : 410.0;
    double beginHeight = MediaQuery.of(context).orientation == Orientation.portrait ? 90 : 130;


    widthAnimation = Tween<double>(begin: beginWidth, end: screenWidth).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
      ),
    );

    heightAnimation = Tween<double>(begin: beginHeight, end: screenHeight).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double fontSize = isPortrait ? 20.0 : 30.0;


    return Scaffold(
      backgroundColor: Color(0xff01061FFF),

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
                      image: AssetImage('assets/img2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
          // Positioned(
          //   top: isPortrait ? 440 : 185,
          //   left: isPortrait ? 12 : 155,
          //   child:DefaultTextStyle(
          //       style:  TextStyle(
          //         fontSize: fontSize,
          //         fontFamily: 'Bobbers',
          //       ),
          //       child: AnimatedTextKit(
          //         totalRepeatCount: 1,
          //
          //         animatedTexts: [
          //
          //           TyperAnimatedText(
          //             'Believe In',
          //             textAlign:
          //             TextAlign.center,
          //           ),
          //         ],
          //       )),
          // ),
          // if (showAnimatedBuilder)
            Center(
              child: AnimatedBuilder(

                animation: animationController,
                builder: (context, child) {
                  return Container(
                    color: Color(0xff010329).withOpacity(0.5),
                    width: widthAnimation.value,
                    height: heightAnimation.value,
                    child: Center(
                      child: Container(
                        height: isPortrait ? 60 : 90,
                        width: isPortrait ? 250 : 322,
                        // color: Colors.yellow,
                        child: Text(
                          textAlign: TextAlign.center,
                          maxLines: 2,

                          "Winners Never Quit, And Quitters Never Win",
                          style: TextStyle(

                          color: Colors.white,
                              fontFamily: 'Poppins',

                              fontWeight: FontWeight.w900,
                              fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          Positioned(
            top: isPortrait ? 740 : 285,
            left: isPortrait ? 135 : 300,
            child: AnimatedOpacity(
              opacity: animationController.status == AnimationStatus.completed ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Text("Don't give up",style: TextStyle(
                  color: Colors.white,
                  fontSize: isPortrait ? 20:25
              ),),
            ),
          ),
        ],
      ),
    );

  }
}










//    import 'dart:math';
//
// import 'package:animated_text_kit/animated_text_kit.dart';
//     import 'package:flutter/material.dart';
//     import 'package:flutter_svg/flutter_svg.dart';
//     import 'package:get/get.dart';
//
//     import '../text.dart';
//     enum Shape { Diamond, Circle, Rectangle }
//
//     class DotAnimation extends StatefulWidget {
//       const DotAnimation({Key? key}) : super(key: key);
//
//       @override
//       State<DotAnimation> createState() => _DotAnimationState();
//     }
//
//     class _DotAnimationState extends State<DotAnimation>
//         with TickerProviderStateMixin {
//       // late AnimationController zoomController;
//       // late Animation<double> zoomAnimation;
//       late AnimationController zoomController;
//       late AnimationController zoomYellowController;
//       late Animation<double> zoomAnimation;
//       late Animation<double> zoomYellowAnimation;
//       late Animation<double> widthAnimation;
//       late Animation<double> heightAnimation;
//       late Animation<double> opacityAnimation;
//       late Animation<double> textSizeAnimation;
//
//     // New animation for opacity
//       late AnimationController slideController;
//       late Shape selectedShape;
//
//       late Animation<Offset> slideAnimation;
//       late AnimationController animationController;
//       late double screenWidth;
//       late double screenHeight;
//       double yellowContainer = 130;
//       double textSize = 30.0;
//       late ImageProvider _backgroundImage;
//       bool showAnimatedBuilder = false; // Add a flag to control the visibility
//
//       @override
//       void initState() {
//         super.initState();
//         // sizeAnimation = Tween<double>(begin: 10, end: 130).animate(
//         //   CurvedAnimation(
//         //     parent: animationController,
//         //     curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
//         //   ),
//         // );
//         selectedShape = _getRandomShape();
//
//
//         zoomController = AnimationController(
//           vsync: this,
//           duration: Duration(milliseconds: 1200),
//         );
//         zoomAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
//           CurvedAnimation(
//             parent: zoomController,
//             curve: Curves.decelerate,
//           ),
//         );
//         zoomYellowController = AnimationController(
//           vsync: this,
//           duration: Duration(milliseconds: 100),
//         );
//         zoomYellowAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
//           CurvedAnimation(
//             parent: zoomController,
//             curve: Curves.decelerate,
//           ),
//         );
//         slideController = AnimationController(
//           vsync: this,
//           duration: Duration(milliseconds: 1000),
//         );
//
//         slideAnimation = Tween<Offset>(
//           begin: Offset(-1.0, 0.0),
//           end: Offset.zero,
//         ).animate(
//           CurvedAnimation(
//             parent: slideController,
//             curve: Curves.easeInOut,
//           ),
//         );
//         slideController.forward().then((_) {
//           // Start zoom animation after slide animation completes
//           zoomController.forward();
//         });
//         // zoomController.forward();
//
//         animationController =
//             AnimationController(vsync: this, duration: Duration(seconds: 2));
//         textSizeAnimation = Tween<double>(begin: 30.0, end: 60.0).animate(
//           CurvedAnimation(
//             parent: animationController,
//             curve: Curves.easeInOut, // Adjust curve as needed
//           ),
//         );
//
//         animationController.addListener(() {
//           setState(() {});
//         });
//
//         animationController.addStatusListener((status) {
//           if (status == AnimationStatus.completed) {
//             setState(() {
//               // Increase text size after animation completes
//               textSize = 60.0;
//             });
//             Future.delayed(Duration(seconds: 1), () {
//               setState(() {
//                 showAnimatedBuilder = true;
//               });
//               animationController.reverse();
//             });
//           } else if (status == AnimationStatus.dismissed) {
//             // setState(() {
//             //   textSize = 30;
//             // });
//             animationController.stop();
//           }
//         });
//         //start animation
//         Future.delayed(Duration(seconds: 1), () {
//           setState(() {
//             showAnimatedBuilder = true;
//           });
//           animationController.forward();
//         });
//
//         // Start the animations
//
//         // Initialize opacity animation
//         // opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
//         //   CurvedAnimation(
//         //     parent: animationController,
//         //     curve: Interval(0.5, 1.0, curve: Curves.easeInOutCubicEmphasized), // Adjust timing
//         //   ),
//         // );
//         // animationController.forward();
//
//         // _backgroundImage = AssetImage('assets/cyclist-riding-on-the-rocky-riverside-2023-11-27-05-18-53-utc.jpg');
//         // precacheImage(_backgroundImage, context);
//       }
//
//       Shape _getRandomShape() {
//         final shapes = Shape.values;
//         final random = Random();
//         return shapes[random.nextInt(shapes.length)];
//       }
//
//       @override
//       void dispose() {
//         zoomController.dispose();
//         slideController.dispose();
//         zoomYellowController.dispose();
//
//         animationController.dispose();
//         super.dispose();
//       }
//
//       @override
//       void didChangeDependencies() {
//         super.didChangeDependencies();
//         screenWidth = MediaQuery.of(context).size.width;
//         screenHeight = MediaQuery.of(context).size.height;
//         double beginWidth =
//             MediaQuery.of(context).orientation == Orientation.portrait
//                 ? 130.0
//                 : 170.0;
//         double beginHeight =
//             MediaQuery.of(context).orientation == Orientation.portrait ? 40 : 50;
//
//         widthAnimation = Tween<double>(begin: 0, end: screenWidth).animate(
//           CurvedAnimation(
//             parent: animationController,
//             curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
//           ),
//         );
//
//         heightAnimation = Tween<double>(begin: 0, end: screenHeight).animate(
//           CurvedAnimation(
//             parent: animationController,
//             curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
//           ),
//         );
//       }
//
//       @override
//       Widget build(BuildContext context) {
//         bool isPortrait =
//             MediaQuery.of(context).orientation == Orientation.portrait;
//         double fontSize = isPortrait ? 28.0 : 40.0;
//
//         return Scaffold(
//           backgroundColor: Color(0xff01061FFF),
//           body: Stack(
//             children: [
//               ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   Colors.black
//                       .withOpacity(0.4), // Adjust opacity and color to control dullness
//                   BlendMode.darken,
//                 ),
//                 child: AnimatedBuilder(
//                   animation: zoomController,
//                   builder: (context, child) {
//                     return AnimatedBuilder(
//                       animation: slideController,
//                       builder: (context, child) {
//                         return Transform.scale(
//                           scale: zoomAnimation.value,
//                           child: SlideTransition(
//                             position: slideAnimation,
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.height,
//                               decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage(
//                                       'assets/snowboarder-is-jumping-with-snowboard-from-snowhil-2023-11-27-05-15-29-utc.png'),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//
//
//               if (showAnimatedBuilder)
//
//                 Center(
//                   child: AnimatedBuilder(
//                     animation: zoomYellowController,
//                     builder: (context, child) {
//                       return Transform.scale(
//                         scale: zoomYellowAnimation.value,
//                         child: AnimatedBuilder(
//                           animation: animationController,
//                           builder: (context, child) {
//                             return SizedBox(
//                               width: widthAnimation.value,
//                               height: heightAnimation.value,
//                               child: CustomPaint(
//                                 painter: DiamondPainter(
//                                   color: Color(0xfffdd248).withOpacity(0.8),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Center(
//                 //   child: Positioned(
//                 //
//                 //     child: AnimatedBuilder(
//                 //       animation: animationController,
//                 //       builder: (context, child) {
//                 //         return Container(
//                 //           decoration: BoxDecoration(
//                 //             color: Color(0xfffdd248),
//                 //             shape: BoxShape.circle,
//                 //             // borderRadius: BorderRadius.circular(80)
//                 //           ),
//                 //           width: widthAnimation.value,
//                 //           height: heightAnimation.value,
//                 //         );
//                 //       },
//                 //     ),
//                 //   ),
//                 // ),
//
//               Center(
//
//                 child: DefaultTextStyle(
//                     style: TextStyle(
//                       fontSize: fontSize,
//                       fontFamily: 'Bobbers',
//                     ),
//                     child: AnimatedTextKit(
//                       totalRepeatCount: 1,
//                       animatedTexts: [
//                         WavyAnimatedText(
//                           'Believe In Yourslef',
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     )),
//               ),
//               Positioned.fill(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: isPortrait ? MediaQuery.of(context).size.height*0.8 : MediaQuery.of(context).size.height*0.7
//                     ),
//
//                     AnimatedOpacity(
//                       opacity: animationController.status == AnimationStatus.completed
//                           ? 1.0
//                           : 0.0,
//                       duration: Duration(milliseconds: 500),
//                       child: Text(
//                         'Follow Your Dreams',
//                         style: TextStyle(
//                             color: Colors.black, fontSize: isPortrait ? 20 : 25),
//                       ),
//                     ),
//
//                     Spacer(
//                       flex: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0,right: 8, bottom: 40),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset('assets/like.svg'),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width*0.5,
//                           ),
//                           SvgPicture.asset('assets/dislike.svg'),
//                         ],
//                       ),
//                     )
//
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         );
//       }
//     }
//
//     class DiamondPainter extends CustomPainter {
//       final Color color;
//
//       DiamondPainter({required this.color});
//
//       @override
//       void paint(Canvas canvas, Size size) {
//         Paint paint = Paint()..color = color;
//
//         Path path = Path();
//         path.moveTo(size.width / 2, 0); // Move to top center
//         path.lineTo(size.width, size.height / 2); // Line to right middle
//         path.lineTo(size.width / 2, size.height); // Line to bottom center
//         path.lineTo(0, size.height / 2); // Line to left middle
//         path.close(); // Close the path
//
//         canvas.drawPath(path, paint);
//       }
//
//       @override
//       bool shouldRepaint(covariant CustomPainter oldDelegate) {
//         return true;
//       }
//     }
//
//     //import 'dart:math';
//     // import 'package:animated_text_kit/animated_text_kit.dart';
//     // import 'package:flutter/material.dart';
//     // import 'package:flutter_svg/flutter_svg.dart';
//     //
//     // class SlideAnimation extends StatefulWidget {
//     //   const SlideAnimation({Key? key}) : super(key: key);
//     //
//     //   @override
//     //   State<SlideAnimation> createState() => _SlideAnimationState();
//     // }
//     //
//     // class _SlideAnimationState extends State<SlideAnimation>
//     //     with TickerProviderStateMixin {
//     //   late AnimationController zoomController;
//     //   late Animation<double> zoomAnimation;
//     //   late AnimationController slideController;
//     //   late Animation<Offset> slideAnimation;
//     //   late AnimationController animationController;
//     //   late Animation<double> widthAnimation;
//     //   late Animation<double> heightAnimation;
//     //   double yellowContainer = 130;
//     //   late ImageProvider _backgroundImage;
//     //   bool showAnimatedBuilder = false;
//     //
//     //   @override
//     //   void initState() {
//     //     super.initState();
//     //
//     //     zoomController = AnimationController(
//     //       vsync: this,
//     //       duration: Duration(milliseconds: 1200),
//     //     );
//     //     zoomAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
//     //       CurvedAnimation(
//     //         parent: zoomController,
//     //         curve: Curves.decelerate,
//     //       ),
//     //     );
//     //
//     //     slideController = AnimationController(
//     //       vsync: this,
//     //       duration: Duration(milliseconds: 1000),
//     //     );
//     //
//     //     slideAnimation = Tween<Offset>(
//     //       begin: _getRandomOffset(),
//     //       end: Offset.zero,
//     //     ).animate(
//     //       CurvedAnimation(
//     //         parent: slideController,
//     //         curve: Curves.easeInOut,
//     //       ),
//     //     );
//     //
//     //     slideController.forward().then((_) {
//     //       zoomController.forward();
//     //     });
//     //
//     //     animationController = AnimationController(
//     //       vsync: this,
//     //       duration: Duration(seconds: 2),
//     //     );
//     //
//     //     animationController.addListener(() {
//     //       setState(() {});
//     //     });
//     //
//     //     animationController.addStatusListener((status) {
//     //       if (status == AnimationStatus.completed) {
//     //         setState(() {
//     //           showAnimatedBuilder = true;
//     //         });
//     //         animationController.reverse();
//     //       } else if (status == AnimationStatus.dismissed) {
//     //         animationController.stop();
//     //       }
//     //     });
//     //
//     //     Future.delayed(Duration(seconds: 1), () {
//     //       setState(() {
//     //         showAnimatedBuilder = true;
//     //       });
//     //       animationController.forward();
//     //     });
//     //   }
//     //
//     //
//     //   @override
//     //   void dispose() {
//     //     zoomController.dispose();
//     //     slideController.dispose();
//     //     animationController.dispose();
//     //     super.dispose();
//     //   }
//     //
//     //   Offset _getRandomOffset() {
//     //     Random random = Random();
//     //     int randomNumber = random.nextInt(4);
//     //     switch (randomNumber) {
//     //       case 0:
//     //         return Offset(-1.0, 0.0); // Slide from left
//     //       case 1:
//     //         return Offset(1.0, 0.0); // Slide from right
//     //       case 2:
//     //         return Offset(0.0, -1.0); // Slide from top
//     //       case 3:
//     //         return Offset(0.0, 1.0); // Slide from bottom
//     //       default:
//     //         return Offset.zero;
//     //     }
//     //   }
//     //
//     //   @override
//     //   Widget build(BuildContext context) {
//     //     return Scaffold(
//     //       backgroundColor: Color(0xff01061FFF),
//     //       body: Stack(
//     //         children: [
//     //           // Your background image or color
//     //           AnimatedBuilder(
//     //             animation: zoomController,
//     //             builder: (context, child) {
//     //               return AnimatedBuilder(
//     //                 animation: slideController,
//     //                 builder: (context, child) {
//     //                   return Transform.scale(
//     //                     scale: zoomAnimation.value,
//     //                     child: SlideTransition(
//     //                       position: slideAnimation,
//     //                       child: Container(
//     //                         width: MediaQuery.of(context).size.width,
//     //                         height: MediaQuery.of(context).size.height,
//     //                         decoration: BoxDecoration(
//     //                           image: DecorationImage(
//     //                             image: AssetImage(
//     //                                 'assets/snowboarder-is-jumping-with-snowboard-from-snowhil-2023-11-27-05-15-29-utc.png'),
//     //                             fit: BoxFit.fill,
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   );
//     //                 },
//     //               );
//     //             },
//     //           ),
//     //           // Your yellow container
//     //           if (showAnimatedBuilder)
//     //             Positioned(
//     //               right: 1,
//     //               top: 1,
//     //               child: AnimatedBuilder(
//     //                 animation: animationController,
//     //                 builder: (context, child) {
//     //                   return Container(
//     //                     decoration: BoxDecoration(
//     //                       color: Color(0xfffdd248),
//     //                     ),
//     //                     width: widthAnimation.value,
//     //                     height: heightAnimation.value,
//     //                   );
//     //                 },
//     //               ),
//     //             ),
//     //           // Your text widgets and other UI elements
//     //         ],
//     //       ),
//     //     );
//     //   }
//     // }