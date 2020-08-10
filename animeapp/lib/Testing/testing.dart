import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // bool ison = false;

  _showMyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: Container(
            height: 100,
            width: 100,
            color: Colors.white,
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      week = weekList[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${weekList[index]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final List<String> weekList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String week = 'Sunday';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showMyDialog();
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color: Colors.blueAccent,
          child: Row(
            children: [
              Text(
                week,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}