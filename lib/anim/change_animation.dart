import 'package:flutter/material.dart';

class ChangeAnimation extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 175.0);
  // use ColorTween
  static final _colorTween =
      ColorTween(begin: Colors.yellow, end: Colors.lightGreenAccent);

  ChangeAnimation({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: _sizeTween.evaluate(animation),
          height: _sizeTween.evaluate(animation),
          child: FlatButton(
            onPressed: () {},
            child: Text("Button"),
            color: _colorTween.evaluate(animation),
          ),
        ),
      ),
    );
  }
}
