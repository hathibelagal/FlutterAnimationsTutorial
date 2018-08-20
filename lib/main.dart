import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyStateWithCurves();
  }
}

class MyState extends State<MyApp>
              with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this,
        duration: new Duration(seconds: 4));
    Tween tween = new Tween<double>(begin: 10.0, end: 180.0);
    animation = tween.animate(controller);
    animation.addListener(() {
      setState(() {
      });
    });
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        controller.reverse();
      else if(status == AnimationStatus.dismissed)
        controller.forward();
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Positioned(
                child: new Material(
                    child: new Icon(Icons.airport_shuttle,
                        textDirection: TextDirection.ltr,
                        size: 81.0
                    )
                ),
                left: animation.value, // Animated value
                top: 30.0  // Fixed value
            )
          ],
          textDirection: TextDirection.ltr,)
    );
  }
}

class MyStateWithAnimatedWidgets extends State<MyApp>
    with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this,
                    duration: new Duration(seconds: 6));
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new RotationTransition(
            turns: controller,
            child: new Text("\u{1F43A}",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 85.0),)
        )
    );
  }
}

class MyStateWithAnimatedWidgetScale extends State<MyApp>
    with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this,
        duration: new Duration(seconds: 6));
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new ScaleTransition(
            scale: controller,
            child: new Text("\u{1F43A}",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 85.0),)
        )
    );
  }
}

class MyStateWithCurves extends State<MyApp>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this,
        duration: new Duration(seconds: 5)
    );

    CurvedAnimation curvedAnimation = new CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut
    );

    Tween myTween = new Tween<double>(begin: 150.0, end: 430.0);
    animation = myTween.animate(curvedAnimation);

    animation.addListener(() {
      setState(() {
      });
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Positioned(
          child: new Text("\u{26BE}",
              textDirection: TextDirection.ltr,
              style: new TextStyle(
                fontSize: 70.0
              )
          ),
          left: 50.0,
          top: animation.value
        )
      ],
      textDirection: TextDirection.ltr,
    );
  }
}