import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/animation/ImageAnimation.dart';
import 'package:testing/animation/dot_animation.dart';

import 'animation1.dart';
import 'animation2.dart';
import 'animation3.dart';
import 'animation4.dart';
import 'slide_animation.dart';

class ViewScreen extends StatelessWidget {
   ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              child:Text("First Concept") ,
              onPressed: (){
                Get.to(() => AnimationTest());
              },
            ),
            ElevatedButton(
              child:Text("Second Concept") ,
              onPressed: (){
                Get.to(() => AnimationTest2());
              },
            ),
            ElevatedButton(
              child:Text("Third Concept") ,
              onPressed: (){
                Get.to(() => AnimatedAlignExample());
              },
            ),
            ElevatedButton(
              child:Text("Dot Animation") ,
              onPressed: (){
                Get.to(() => DotAnimation());
              },
            ),
            ElevatedButton(
              child:Text("Fourth Concept") ,
              onPressed: (){
                Get.to(() => FourthConcept());
              },
            ),
            ElevatedButton(
              child:Text("Slide Animation") ,
              onPressed: (){
                Get.to(() => SlideAnimation());
              },
            ),

          ],
        ),
      ),
    );
  }
}
