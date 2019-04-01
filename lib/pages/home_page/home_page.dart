import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_demo_app/layouts/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _title = 'Home Page';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(_title),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.apps),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share), onPressed: _launchURL),
          ],
        ),
        drawer: new MyDrawer(),
        body: Center(
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
                  color: Colors.blue),
            ],
          ),
        ));
  }
}

_launchURL() async {
  var url = 'https://liuvigongzuoshi.github.io/cesium-react/index.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
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
