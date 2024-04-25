import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:testing/stories_controller.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StoriesController controller = Get.put(StoriesController());
    return Scaffold(
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: true,
            child: StoryView(
              storyItems: controller.stories,
              onStoryShow: (storyItem, index) {
                print("Showing a story");
              },
              onComplete: () {
                print("Completed a cycle");
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              controller: controller.storyController,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).orientation == Orientation.portrait
                ? 350
                : 150,
            child: OrientationBuilder(
              builder: (context, orientation) {
                return IconButton(
                  onPressed: () {
                    controller.storyController.previous();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
