import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    // animation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    animation = new Tween(begin: 0.0, end: 10.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(from: 5.0);
        } else if (status == AnimationStatus.reverse) {
          this.setState(() {
            _counter = _counter - 400;
          });
        }
      });

    // _controller.addListener(() {
    //   this.setState(() {
    //     _counter++;
    //     debugPrint(" Counter is ==>> $_counter");
    //   });
    // });
    animation.addListener(() {
      this.setState(() {
        _counter++;
        debugPrint(" Counter is ==>> $_counter");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Text(
        _controller.isAnimating
            ? (_counter).toStringAsFixed(2)
            : "Let's Begin!",
        // style: TextStyle(fontSize: 29.0 * _controller.value + 16.0),
        style: TextStyle(fontSize: 29.0 * animation.value + 16.0),
      ),
      onTap: () {
        _controller.forward(from: 0.0);
      },
    );
  }
}
