import 'package:flutter/material.dart';

class ExpandionPanelDemo extends StatefulWidget {
  @override
  _ExpandionPanelDemoState createState() => _ExpandionPanelDemoState();
}

class _ExpandionPanelDemoState extends State<ExpandionPanelDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpandionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Panel A',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Text('Context for Panel A.'),
                  ),
                  // isExpanded: false,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}