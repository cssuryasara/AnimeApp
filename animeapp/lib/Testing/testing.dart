
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text('something'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
      )),
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  var opacity=0.0;
  @override
  void initState() { 
    super.initState();
    setState(() {
      opacity=1;
    });
    Future.delayed(Duration(seconds: 2),(){
       Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TecondRoute()),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Image.asset(
            'assests/thumb-1920-677583.png',
            fit: BoxFit.fill,
          ),
        ),
      )
    );
  }
}
 
 class TecondRoute extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Container(
       child:Text('sdcjhmn')
     );
   }
 }