import 'package:flutter/material.dart';
import 'package:video_01/demo/http/http_demo.dart';
import 'package:video_01/demo/stream/stream_demo.dart';
// import 'model/post.dart';  // 导入了没有使用的dart 也会报错
import './demo/MODrawer.dart'; 
import './demo/MOListView.dart';
import './demo/MOBottomNavBar.dart';
import './demo/MOBasic.dart';
import './demo/MOLayout.dart';
// import './demo/MOView.dart';
import './demo/MOSliver.dart';
import './demo/MONavigator.dart';
import './demo/form_demo.dart';
import './material_components.dart';
import 'demo/animation/animation_demo.dart';
import 'demo/bloc/block_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/state/state_management_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 隐藏右上角debug标签
      // home: MONavigator(),
      initialRoute: '/animation',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => Page(title: 'About'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc' : (context) => BlocDemo(),
        '/http' : (context) => HttpDemo(),
        '/animation' : (context) => AnimationDemo(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple, // 主题色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), // 高亮颜色
        splashColor: Colors.white,  // 水波纹颜色
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // // leading 导航栏 左边按钮
          // leading: IconButton(  
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration', // 描述
          //   onPressed: () => debugPrint('Navigation button is pressed'),   // null 不可点击状态
          // ),
          title: Text('莫小言'),
          // actions 导航栏 右边按钮数组
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Navigation button is pressed'),
            ),
          ],
          elevation: 0.0,
          // DefaultTabController 才有
          bottom: TabBar(
            unselectedLabelColor: Colors.black38, // 未选中tabBtn的颜色
            indicatorColor: Colors.black54,       // 下划线颜色
            indicatorSize: TabBarIndicatorSize.label, // 下划线宽度
            indicatorWeight: 1.0, // 下划线高度
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)), 
              Tab(icon: Icon(Icons.view_quilt)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MOListView(),
            MOBasic(),
            MOLayout(),
            // MOView(),
            SliverDemo(),
          ],
        ),
        // 左侧抽屉
        drawer: MODrawer(),
        // 右侧抽屉
        endDrawer: Text('This is end drawer'),
        bottomNavigationBar: MOBottomNavBar(),
      ),
    );
  }
}
