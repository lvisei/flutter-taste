import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blue),
    );
  }
}
