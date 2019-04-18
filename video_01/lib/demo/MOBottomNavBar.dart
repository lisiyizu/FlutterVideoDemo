import 'package:flutter/material.dart';

class MOBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MOBottomNavBarState();
  }
}

class _MOBottomNavBarState extends State<MOBottomNavBar> {
  int _currentIndex = 0;

  void _onTapHander(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapHander,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black, // 选中颜色
          items: [  // 默认超过4个，不显示了（type改了）
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('My'),
            ),
          ],
        );
  }
}