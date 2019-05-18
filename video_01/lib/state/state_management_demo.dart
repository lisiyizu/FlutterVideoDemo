import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// class StateManagemnetDemo extends StatefulWidget {
//   @override
//   _StateManagemnetDemoState createState() => _StateManagemnetDemoState();
// }

class StateManagemnetDemo extends StatelessWidget {
  // int _count = 0;
  // void _increaseCount() {
  //   setState(() {
  //     _count += 1;
  //   });
  //   print(_count);
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      // CounterProvider(
      // count: _count,
      // increaseCount: _increaseCount,
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagemnetDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     setState(() {
        //       _count += 1;
        //     });
        //   },
        // ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
    // // 直接使用父视图定义的属性 ！！！
    // final int count = CounterProvider.of(context).count;
    // final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;

    // return Center(
    //   child: ActionChip(
    //     label: Text('$count'),
    //     onPressed: increaseCount,
    //   ),
    // );
  }
}

// 它定义的属性，可用于它的子视图
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}

