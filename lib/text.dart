import 'package:flutter/material.dart';


class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TypewriterText(
            text: "Hello, World!",
            duration: Duration(milliseconds: 2000),
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final Duration duration;
  final TextStyle? style;

  TypewriterText({
    required this.text,
    required this.duration,
    this.style,
  });

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _textAnimation = IntTween(begin: 0,end: widget.text.length,).animate(_controller)..addListener(()
    {
      setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.substring(0, _textAnimation.value),
      // style: widget.style,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}























































