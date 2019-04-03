import 'package:flutter/material.dart';
import 'package:flutter_demo_app/widgets/Checkerboard.dart';
import 'package:flutter_demo_app/widgets/Clock.dart';
import 'package:flutter_demo_app/widgets/GradientCircularProgress.dart';
import 'package:flutter_demo_app/widgets/Thermometer.dart';

class CustomPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        child: Center(
          child: Column(children: <Widget>[
            Container(height: 20),
            Clock(),
            Container(height: 20),
            Checkerboard(),
            Container(height: 20),
            GradientCircularProgress(),
            Container(height: 40),
            Thermometer(
              width: 300,
              degree: 50,
            ),
          ]),
        ),
      ),
    );
  }
}
