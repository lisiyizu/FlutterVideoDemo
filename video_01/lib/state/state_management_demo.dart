import 'package:flutter/material.dart';

class StateManagemnetDemo extends StatefulWidget {
  @override
  _StateManagemnetDemoState createState() => _StateManagemnetDemoState();
}

class _StateManagemnetDemoState extends State<StateManagemnetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagemnetDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Chip(
          label: Text('$count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
      ),
    );
  }
}