import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/shared/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  final avatarUrl = ServerUrl.avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0, bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(avatarUrl),
                      radius: 50.0,
                    ),
                  ),
                  Text(
                    "liuvigongzuoshi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(CupertinoIcons.tag),
                    title: const Text('liuvigongzuoshi'),
                  ),
                  ListTile(
                    leading: const Icon(CupertinoIcons.mail),
                    title: const Text('liuvigongzuoshi@foxmial.com'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
