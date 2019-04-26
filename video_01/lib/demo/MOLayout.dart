import 'package:flutter/material.dart';

class MOLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( // Column Row
      // 默认start, center, end
      // spaceAround: 均匀分布在Items周围
      // spaceBetween: 均匀分布在Items之间
      // spaceEvenly: 均匀分布
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,   // 主轴
      crossAxisAlignment: CrossAxisAlignment.center,  // 交叉轴, 默认:center, start, end, stretch
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 200.0,
            maxWidth: 200.0,
            minHeight: 200.0,
            maxHeight: 200.0,
          ),
          child: Container(
            color: Color.fromRGBO(3, 54, 255, 1.0),
          ),
        ),
      ],
      // children: <Widget>[
      //   IconBadge(Icons.pool),
      //   IconBadge(Icons.beach_access, size: 64.0),
      //   IconBadge(Icons.airplanemode_active),
      // ],
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
          aspectRatio: 16.0/9.0, // 宽高比:  例如: 3.0/2.0  16.0/9.0 1/1
          child: Container(
            color: Color.fromRGBO(3, 54, 255, 1.0),
          ),
        );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(    // 叠放
      alignment: Alignment.topLeft, // 9个位置
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            // alignment: Alignment(0.0, 1.0), // x:[-1,1] y:[-1,1]
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // borderRadius: BorderRadius.circular(8.0),
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0),
                ],
              ),
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0,),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        Positioned(
          right: 40.0,
          top: 60.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
        ),
        Positioned(
          right: 20.0,
          top: 120.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
        ),
        Positioned(
          right: 70.0,
          top: 180.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        Positioned(
          right: 30.0,
          top: 230.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
        ),
        Positioned(
          right: 90.0,
          bottom: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        Positioned(
          right: 4.0,
          bottom: -4.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}