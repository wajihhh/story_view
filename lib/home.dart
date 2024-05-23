import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextTestt extends StatelessWidget {
  const TextTestt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width*0.2,
          color: Colors.pink,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Center(
              child: Flexible(
                child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Bobbers',
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,

                      animatedTexts: [

                        WavyAnimatedText(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                          textAlign:
                          TextAlign.center,
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
