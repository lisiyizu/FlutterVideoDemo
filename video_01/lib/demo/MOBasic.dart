import 'package:flutter/material.dart';

class MOBasic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(  // 跟上面的color冲突
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(  // 滤镜
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight, 
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16.0), //EdgeInsets.only(left: 24.0, right: 8.0)
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0), // 会与外层的color冲突
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3.0,
                style: BorderStyle.solid,
              ),
              // Border(
              //   top: BorderSide(  // 上边框
              //     color: Colors.indigoAccent[100],
              //     width: 3.0,
              //     style: BorderStyle.solid,
              //   ),
              //   bottom: BorderSide( // 下边框
              //     color: Colors.indigoAccent[100],
              //     width: 3.0,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              // borderRadius: BorderRadius.circular(16.0),  // 圆角
              // borderRadius: BorderRadius.only(  // 单个圆角
              //   topLeft: Radius.circular(64.0),
              //   bottomLeft: Radius.circular(64.0),
              // ),
              boxShadow: [  // 阴影
                BoxShadow(
                  offset: Offset(6.0, 7.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 1.0,  // 模糊程度
                  spreadRadius: -9.0,  // 阴影范围
                ),
              ],
              // circle 会与 borderRadius: BorderRadius.circular 冲突
              shape: BoxShape.circle, // rectangle 
              gradient: LinearGradient( // 线性渐变：left->right
                colors: [
                  Colors.red,
                  Colors.blue,
                ],
                // 可以设置起止位置：top->bottom
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // gradient: RadialGradient( // 渐变: center->border
              //   colors: [
              //     Colors.red,
              //     Colors.blue,
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'moxiaoyan',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
class TextDemo extends StatelessWidget {
    final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '李白';
  final String _title = '将进酒';

  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》--$_author。\n君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
      // overflow: TextOverflow.clip,  // 切掉
      // overflow: TextOverflow.ellipsis,  // ...
      overflow: TextOverflow.fade,  // 淡掉 ??没看见效果
    );
  }
}
