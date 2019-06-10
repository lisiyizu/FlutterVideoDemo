import 'package:flutter/material.dart';

class MOSlider extends StatefulWidget {
  @override
  _MOSliderState createState() => _MOSliderState();
}

class _MOSliderState extends State<MOSlider> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOSlider'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label: '${_sliderValue.toInt()}',
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('SliderValue: $_sliderValue'),
          ],
        ),
      ),
    );
  }
}