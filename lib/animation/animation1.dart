import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
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
      duration: Duration(milliseconds: 1200),
    );
    zoomAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
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
    double beginWidth = MediaQuery.of(context).orientation == Orientation.portrait ? 0.0 : 0.0;
    double beginHeight = MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height;


    widthAnimation = Tween<double>(begin: beginWidth, end: screenWidth).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
      ),
    );

    heightAnimation = Tween<double>(begin: beginHeight, end: screenHeight).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.6, curve: Curves.easeInOut),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double fontSize = isPortrait ? 28.0 : 40.0;


    return Scaffold(
      backgroundColor: Color(0xff01061FFF),

        body: Stack(

          children: [
            AnimatedBuilder(
              animation: zoomController,
              builder: (context, child) {
                return AnimatedBuilder(
                  animation: slideController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: zoomAnimation.value,
                      child: SlideTransition(
                        position: slideAnimation,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/snowboarder-is-jumping-with-snowboard-from-snowhil-2023-11-27-05-15-29-utc.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Positioned(
              top: isPortrait ? 440 : 185,
              left: isPortrait ? 12 : 155,
              child:DefaultTextStyle(
                  style:  TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Bobbers',
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,

                    animatedTexts: [

                      TyperAnimatedText(
                        'Believe In',
                        textAlign:
                        TextAlign.center,
                      ),
                    ],
                  )),
            ),
            if (showAnimatedBuilder)
              Center(
                child: AnimatedBuilder(

                  animation: animationController,
                  builder: (context, child) {
                    return Container(
                      color: Color(0xfffdd248).withOpacity(0.8),
                      width: widthAnimation.value,
                      height: heightAnimation.value,
                      // child: Center(
                      //   child: Text(
                      //     "Yourself",
                      //     style: TextStyle(
                      //         fontFamily: 'Poppins',
                      //
                      //         fontWeight: FontWeight.w900,
                      //         fontSize: animationController.status == AnimationStatus.reverse
                      //             ?textSizeAnimation.value
                      //             : fontSize// Apply text size
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
              ),
          ],
        ),
      );

  }
}










// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../text.dart';
// import 'controller.dart';
//
//
//
// class AnimationTest extends StatelessWidget {
//   final AnimationTestController controller = Get.put(AnimationTestController());
//
//   @override
//   Widget build(BuildContext context) {
//     bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//     double fontSize = isPortrait ? 25.0 : 40.0;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
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
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//               child: TypewriterText(
//                 text: "Believe in",
//                 duration: Duration(milliseconds: 1000),
//               ),
//             ),
//           ),
//           Center(
//             child: GetBuilder<AnimationTestController>(
//               builder: (_) {
//                 return AnimatedContainer(
//                   duration: Duration(seconds: 2),
//                   curve: Curves.easeInOut,
//                   width: controller.widthAnimation.value,
//                   height: controller.heightAnimation.value,
//                   color: Colors.yellow,
//                   child: Center(
//                     child: Text(
//                       "Yourself",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w900,
//                         fontSize: _.textSize,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
