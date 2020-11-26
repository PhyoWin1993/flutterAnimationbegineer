import 'package:animation/anim/change_animation.dart';
// import 'package:animation/anim/counter_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Learning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        duration: const Duration(milliseconds: 1800), vsync: this);
    // animation =
    //     new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
    //       ..addListener(() {
    //         setState(() {
    //           debugPrint("Animation running => ${animation.value}");
    //         });
    //       });
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: new Center(
      //     child: Text(
      //   "Text Hello Word",
      //   style: TextStyle(fontSize: 19.0 * animation.value),
      // )),

      // body: Center(child: new CounterAnimation()),
      body: new ChangeAnimation(animation: animation),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
