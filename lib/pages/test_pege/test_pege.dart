import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo_app/utils/shared_preferences.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    SharedPrefrencesUtil.getInt('_counter').then((int value) {
      setState(() {
        _counter = value ?? 0;
      });
    });
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await SharedPrefrencesUtil.putInt('_counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text('Increment'),
          ),
          RaisedButton(
            onPressed: getHttp,
            child: Icon(Icons.add, color: Colors.white),
            shape: CircleBorder(),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

void getHttp() async {
  try {
    Response response = await Dio().get("https://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}
