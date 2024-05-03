// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:story_view/widgets/story_view.dart';
// import 'package:testing/stories_controller.dart';
//
// import 'home.dart';
//
// class StoriesPage extends StatelessWidget {
//   const StoriesPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final StoriesController controller = Get.put(StoriesController());
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           IgnorePointer(
//             ignoring: true,
//             child: StoryView(
//               storyItems: controller.stories,
//               onStoryShow: (storyItem, index) {
//                 print("Showing a story");
//               },
//               onComplete: () {
//                 // showDialog(
//                 //   context: context,
//                 //   builder: (BuildContext context) {
//                 //     return AlertDialog(
//                 //       title: const Text('Story Completed'),
//                 //       content: const Text("You've completed viewing all stories."),
//                 //       actions: [
//                 //         TextButton(
//                 //           onPressed: () {
//                 //             Get.to(Home());
//                 //           },
//                 //           child: Text('Ok'),
//                 //         )
//                 //       ],
//                 //     );
//                 //   },
//                 // );
//               },
//               progressPosition: ProgressPosition.top,
//               repeat: false,
//               controller: controller.storyController,
//             ),
//           ),
//           // Positioned(
//           //     top: MediaQuery.of(context).orientation == Orientation.portrait ? 350 : 150,
//           //     left: 50,
//           //     child: AnimatedTextExample()),
//           Positioned(
//             top: MediaQuery.of(context).orientation == Orientation.portrait ? 350 : 150,
//             child: OrientationBuilder(
//               builder: (context, orientation) {
//                 return IconButton(
//                   onPressed: () {
//                     controller.storyController.previous();
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios_new_rounded,
//                     color: Colors.white,
//                   ),
//                 );
//               },
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }



// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
//
// class TestAnimation extends StatelessWidget {
//   const TestAnimation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       title: Text("Test"),
//       centerTitle: true,
//     ),
//       body: Center(
//         child: Expanded(
//           child: Container(
//             color: Colors.blueGrey,
//             height: 300,
//             width: 400,
//             child: DefaultTextStyle(
//                 style: const TextStyle(
//                   fontSize: 30.0,
//                   fontFamily: 'Bobbers',
//                 ),
//
//                 child: AnimatedTextKit(
//                   animatedTexts: [
//                     RotateAnimatedText(
//                       "Hello hello testing Hello hello testing hello Hello hello testing hello ",
//                       textAlign:
//                       TextAlign.center,
//                     ),
//                   ],
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          // Use the properties stored in the State class.
          width: MediaQuery.of(context).size.width*0.5,
          height: MediaQuery.of(context).size.height*0.5,
          decoration: BoxDecoration(
            color: Colors.yellow
            // borderRadius: ,
          ),
          // Define how long the animation should take.
          duration: const Duration(microseconds: 100),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
