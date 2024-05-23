// import 'package:flutter/material.dart';
//
// import '../text.dart';
//
// class ImageAnimation extends StatefulWidget {
//   const ImageAnimation({Key? key}) : super(key: key);
//
//   @override
//   State<ImageAnimation> createState() => _ImageAnimationState();
// }
//
// class _ImageAnimationState extends State<ImageAnimation>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> widthAnimation;
//   late Animation<double> heightAnimation;
//   late Animation<double> opacityAnimation;
//   late Animation<double> textSizeAnimation;
//   // New animation for opacity
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
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     textSizeAnimation = Tween<double>(begin: 30.0, end: 60.0).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Curves.easeInOut, // Adjust curve as needed
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
//         Future.delayed(Duration(seconds: 1), () {
//           setState(() {
//             showAnimatedBuilder = true;
//           });
//           // animationController.reverse();
//         });
//       } else if (status == AnimationStatus.dismissed) {
//         // setState(() {
//         //   textSize = 30;
//         // });
//         // animationController.stop();
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
//     // Initialize width animation
//     widthAnimation = Tween<double>(begin: 100, end: screenWidth).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: const Interval(0.5, 0.9, curve: Curves.easeInOut),
//       ),
//     );
//
//     double beginHeight =
//     MediaQuery.of(context).orientation == Orientation.portrait ? 40 : 50;
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
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//
//           AnimatedBuilder(
//             animation: widthAnimation,
//             builder: (context, child) {
//               return Positioned(
//                 left: widthAnimation.value, // Use width animation value here
//                 // top: isPortrait ? 385 : 165,
//                 child: Container(
//                   width: screenWidth,
//                   height: screenHeight,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/morning.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             top: isPortrait ? 385 : 165,
//             left: isPortrait ? 4 : 110,
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
//                             fontFamily: 'Poppins',
//
//                             fontWeight: FontWeight.w900,
//                             fontSize: animationController.status == AnimationStatus.reverse
//                                 ?textSizeAnimation.value
//                                 : fontSize// Apply text size
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
//
//
