import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
      // .map((item) => 'item: $item') // 加前缀
      // .where((item) => item.length > 9) // 加条件
      .debounce(Duration(milliseconds: 500))  // 加延时
      .listen((data) => print(data));
    // _textFieldSubject.close();

    // Observable<String> _observable = 
      // Observable(Stream.fromIterable(['hello', '您好']));   // 两个回调
      // Observable.fromFuture(Future.value('hello ~'));
      // Observable.fromIterable(['hello', '您好']); // 两个回调
      // Observable.just('hello ~');
      // Observable.periodic(Duration(seconds: 3), (x) => x.toString()); // 每3s，回调一次

    // _observable.listen(print);
    // PublishSubject<String> _subject = PublishSubject<String>(); // listen之前add的数据没有回调
    // BehaviorSubject<String> _subject = BehaviorSubject<String>(); // listen之前add的数据有回调
    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2); 

    // _subject.listen((data) => print('listen 1:$data'));
    // _subject.add('hello');
    // _subject.listen((data) => print('listen 2:${data.toUpperCase()}')); 
    // _subject.add('hola');
    // listen 1:hello                                                 
    // listen 2:HELLO                                                 
    // listen 2:HOLA                                                  
    // listen 1:hola  

    _subject.add('hello');
    _subject.add('hola');
    _subject.add('hi');
    _subject.listen((data) => print('listen 1:$data'));
    _subject.listen((data) => print('listen 2:${data.toUpperCase()}')); 
    // BehaviorSubject
    // listen 1:hola
    // listen 2:HOLA 

    // ReplaySubject
    // listen 1:hello 
    // listen 2:HELLO 
    // listen 1:hola
    // listen 2:HOLA 
    _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}