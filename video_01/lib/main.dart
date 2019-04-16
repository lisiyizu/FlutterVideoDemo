import 'package:flutter/material.dart';
import 'model/post.dart'

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

class Home extends StatelessWidget {
  Widget _ListItemBuilder(BuildContext context, int index) {
    return Text(posts[index].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('莫小言'),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder:  _ListItemBuilder(context, index),
      ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Center(
      child: Text(
        'Hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        )
      ),
    );
  }
}