import 'package:flutter/material.dart';

class BouncingImage extends StatefulWidget {
  final String imageUrl;

  BouncingImage({required this.imageUrl});

  @override
  _BouncingImageState createState() => _BouncingImageState();
}

class _BouncingImageState extends State<BouncingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat(reverse: true);

    // Set up the animation
    _animation = TweenSequence<Offset>([
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0, -2), end: Offset(0, 4)), weight: 1),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0, 4), end: Offset(0, -2)), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCirc,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_animation.value.dx * 10, _animation.value.dy * 10),
      child: Image.asset(
        widget.imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
