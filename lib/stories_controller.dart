import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class StoriesController extends GetxController {
  final StoryController storyController = StoryController();


  // List of stories
  final List<StoryItem> stories = [
    StoryItem.text(
      title: "I guess you'd love to see more of our food. That's great.",
      backgroundColor: Colors.blue,
    ),
    StoryItem.text(
      title: "Nice!\n\nTap to continue.",
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        fontFamily: 'Dancing',
        fontSize: 40,
      ),
    ),
    StoryItem.pageImage(
      url:
      "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
      caption: const Text(
        "Still sampling",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ), controller: StoryController(),
    ),
    StoryItem.pageImage(
      url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
      caption: const Text(
        "Working with gifs",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ), controller: StoryController(),
    ),
    StoryItem.pageVideo(
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      caption: const Text(
        "Hello, from the other side",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ), controller: StoryController(),

    ),
  ];

  @override
  void onClose() {
    storyController.dispose();
    super.onClose();
  }
}
