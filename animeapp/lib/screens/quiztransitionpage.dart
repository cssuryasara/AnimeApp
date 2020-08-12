import 'package:flutter/material.dart';

//packages
import 'package:flare_flutter/flare_actor.dart';


class QuizTransitionPage extends StatefulWidget {
  const QuizTransitionPage({Key key}) : super(key: key);

  @override
  _QuizTransitionPageState createState() => _QuizTransitionPageState();
}

class _QuizTransitionPageState extends State<QuizTransitionPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(
          context,'/second' );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor(
        'assests/transition.flr',
        animation: 'transition',
      ),
    );
  }
}
