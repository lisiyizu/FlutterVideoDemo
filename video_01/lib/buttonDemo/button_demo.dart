import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Raised：凸起  Flat：平坦 Outline：边框
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton( 
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,  // 水溅开的颜色
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,  // 水溅开的颜色
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          // data: ThemeData(),  // 直接覆盖
          data: Theme.of(context).copyWith( // 覆盖部分
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(), // 圆角
            ),
          ),
          child: RaisedButton( // Raised：凸起  Flat：平坦
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,  // 水溅开的颜色
            elevation: 0.0,
            // color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(width: 16.0,),
        RaisedButton.icon(  // FlatButton.icon
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget outlineBUttonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          // data: ThemeData(),  // 直接覆盖
          data: Theme.of(context).copyWith( // 覆盖部分
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(), // 圆角
            ),
          ),
          child: OutlineButton( 
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],  // 水溅开的颜色
            borderSide: BorderSide( // 边框颜色
              color: Colors.black,
            ),
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            // textTheme: ButtonTextTheme.primary,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(width: 16.0,),
        OutlineButton.icon(  // FlatButton.icon
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton( 
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],  // 水溅开的颜色
            borderSide: BorderSide( // 边框颜色
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton( 
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],  // 水溅开的颜色
            borderSide: BorderSide( // 边框颜色
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 2,
          child: OutlineButton( 
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],  // 水溅开的颜色
            borderSide: BorderSide( // 边框颜色
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton( 
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],  // 水溅开的颜色
                borderSide: BorderSide( // 边框颜色
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton( 
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],  // 水溅开的颜色
                borderSide: BorderSide( // 边框颜色
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    ); 
    
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineBUttonDemo,
            fixedWidthButton,
            expandedButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}