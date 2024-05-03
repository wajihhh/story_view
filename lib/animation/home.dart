import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation.dart';

class ViewScreen extends StatelessWidget {
   ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child:Text("View") ,
          onPressed: (){
            Get.to(() => AnimationTest());
          },
        ),
      ),
    );
  }
}
