import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/stories_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Get.to(const StoriesPage());
        },
        child: const Text("View"),
      )),
    );
  }
}
