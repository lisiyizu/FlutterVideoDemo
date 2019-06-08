import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestDemo'),
        elevation: 0.0,
      ),
      body: TestDemeHome(),
    );
  }
}

class TestDemeHome extends StatefulWidget {
  @override
  _TestDemeHomeState createState() => _TestDemeHomeState();
}

class _TestDemeHomeState extends State<TestDemeHome> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Chip(
          label: Text('hello'),
        ),
        ActionChip(
          label: Text('$count'),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        )
      ],
    );
  }
}

class MOTestDemo {
  static greet(String name) {
    return 'hello $name ~~';
  }
}

