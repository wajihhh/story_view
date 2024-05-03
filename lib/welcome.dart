//
// import 'package:flutter/material.dart';
//
// import 'face_detection/face_detector_view.dart';
//
// class Welcome extends StatelessWidget {
//   const Welcome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 150,
//               height: 150,
//               child: Image.asset("assets/wink.png"),
//             ),
//             Text(
//               "Welcome to winky!",
//               style: Theme.of(context).textTheme.headlineLarge,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (_) => FaceDetectorView(),
//             ),
//           );
//         },
//         label: const Text("Let's wink"),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class ImageTest extends StatelessWidget {
//   const ImageTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.asset("assets/cyclist-riding-on-the-rocky-riverside-2023-11-27-05-18-53-utc.jpg"),
//     );
//   }
// }




//import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../text.dart';
//
// class AnimationTest extends StatefulWidget {
//   const AnimationTest({Key? key}) : super(key: key);
//
//   @override
//   State<AnimationTest> createState() => _AnimationTestState();
// }
//
// class _AnimationTestState extends State<AnimationTest>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> widthAnimation;
//   late Animation<double> heightAnimation;
//   late Animation<double> opacityAnimation; // New animation for opacity
//
//   late AnimationController animationController;
//   late double screenWidth;
//   late double screenHeight;
//   double textSize = 20.0;
//   late ImageProvider _backgroundImage;
//   bool showAnimatedBuilder = false; // Add a flag to control the visibility
//
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
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
//
//       }
//     });
//     //start animation
//     Future.delayed(Duration(seconds: 1),(){
//       setState(() {
//         showAnimatedBuilder = true;
//       });
//       animationController.forward();
//
//
//     });
//
//     // Start the animations
//
//     // Initialize opacity animation
//     opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.0, 0.5, curve: Curves.easeInOut), // Adjust timing
//       ),
//     );
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
//
//     widthAnimation = Tween<double>(begin: 90.0, end: screenWidth).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//
//     heightAnimation = Tween<double>(begin: 40.0, end: screenHeight).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Positioned(top: 200, child: SvgPicture.asset("assets/like.svg")),
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Image.asset(
//               "assets/cyclist-riding-on-the-rocky-riverside-2023-11-27-05-18-53-utc.jpg",
//               fit: BoxFit.fill,
//             ),
//           ),
//
//           Positioned(
//             top: MediaQuery.of(context).orientation == Orientation.portrait
//                 ? 380
//                 : 180,
//             left: MediaQuery.of(context).orientation == Orientation.portrait
//                 ? 10
//                 : 180,
//             child: DefaultTextStyle(
//               style: const TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontFamily: 'Bobbers',
//               ),
//               child: TypewriterText(
//                 text: "Believe in",
//
//                 duration: Duration(milliseconds: 1000),
//                 // style: TextStyle(fontSize: textSize),
//               ),
//             ),
//           ),
//           if(showAnimatedBuilder)
//           // Center(
//           Center(
//             child: AnimatedBuilder(
//               animation: animationController,
//               builder: (context, child) {
//                 return Container(
//                   color: Colors.yellow,
//                   width: widthAnimation.value,
//                   height: heightAnimation.value,
//                   child: Center(
//                     child: Text(
//                       "Yourself",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: textSize, // Apply text size
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


///

//Todo simple animation

//import 'package:flutter/material.dart';
//
// import '../text.dart';
//
// class AnimationTest extends StatefulWidget {
//   const AnimationTest({Key? key}) : super(key: key);
//
//   @override
//   State<AnimationTest> createState() => _AnimationTestState();
// }
//
// class _AnimationTestState extends State<AnimationTest>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> widthAnimation;
//   late Animation<double> heightAnimation;
//   late Animation<double> opacityAnimation; // New animation for opacity
//
//   late AnimationController animationController;
//   late double screenWidth;
//   late double screenHeight;
//   double textSize = 30.0;
//   late ImageProvider _backgroundImage;
//   bool showAnimatedBuilder = false; // Add a flag to control the visibility
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     final CurvedAnimation reverseCurveAnimation = CurvedAnimation(
//       parent: animationController,
//       curve: Curves.easeInOut, // Use an appropriate curve for smooth reversal
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
//         Future.delayed(Duration(seconds: 1), () {
//           setState(() {
//             showAnimatedBuilder = true;
//           });
//           animationController.reverse();
//         });
//       } else if (status == AnimationStatus.dismissed) {
//         setState(() {
//           textSize = 30;
//         });
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
//
//     widthAnimation = Tween<double>(begin: 130.0, end: screenWidth).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
//       ),
//     );
//
//     heightAnimation = Tween<double>(begin: 40.0, end: screenHeight).animate(
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
//     double fontSize = isPortrait ? 28.0 : 40.0;
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
//             top: isPortrait ? 385 : 170,
//             left: isPortrait ? 2 : 150,
//             child: DefaultTextStyle(
//               style:  TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//               child: TypewriterText(
//                 text: "Believe in",
//                 duration: Duration(milliseconds: 1000),
//                 // style: TextStyle(fontSize: textSize),
//               ),
//             ),
//           ),
//           if (showAnimatedBuilder)
//             Center(
//               child: AnimatedBuilder(
//
//                 animation: animationController,
//                 builder: (context, child) {
//                   return Container(
//                     color: Colors.yellow,
//                     width: widthAnimation.value,
//                     height: heightAnimation.value,
//                     child: Center(
//                       child: Text(
//                         "Yourself",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: textSize, // Apply text size
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





////

//Todo yourself text animation when reverse

// import 'package:flutter/material.dart';
//
// import '../text.dart';
//
// class AnimationTest extends StatefulWidget {
//   const AnimationTest({Key? key}) : super(key: key);
//
//   @override
//   State<AnimationTest> createState() => _AnimationTestState();
// }
//
// class _AnimationTestState extends State<AnimationTest>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> widthAnimation;
//   late Animation<double> heightAnimation;
//   late Animation<double> opacityAnimation;
//   late Animation<double> textSizeAnimation;
// // New animation for opacity
//
//   late AnimationController animationController;
//   late double screenWidth;
//   late double screenHeight;
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
//       ),);
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
//
//     widthAnimation = Tween<double>(begin: 130.0, end: screenWidth).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Interval(0.5, 0.9, curve: Curves.easeInOut),
//       ),
//     );
//
//     heightAnimation = Tween<double>(begin: 40.0, end: screenHeight).animate(
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
//     double fontSize = isPortrait ? 28.0 : 40.0;
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
//             top: isPortrait ? 385 : 170,
//             left: isPortrait ? 2 : 150,
//             child: DefaultTextStyle(
//               style:  TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//               ),
//               child: TypewriterText(
//                 text: "Believe in",
//                 duration: Duration(milliseconds: 1000),
//                 // style: TextStyle(fontSize: textSize),
//               ),
//             ),
//           ),
//           if (showAnimatedBuilder)
//             Center(
//               child: AnimatedBuilder(
//
//                 animation: animationController,
//                 builder: (context, child) {
//                   return Container(
//                     color: Colors.yellow,
//                     width: widthAnimation.value,
//                     height: heightAnimation.value,
//                     child: Center(
//                       child: Text(
//                         "Yourself",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: animationController.status == AnimationStatus.reverse
//                                 ?textSizeAnimation.value
//                                 : 30// Apply text size
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
