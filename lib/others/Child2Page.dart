import 'package:flutter/material.dart';

class Child2Page extends StatefulWidget {
  final String title;

  const Child2Page({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _Child2PageState createState() => _Child2PageState();
}

class _Child2PageState extends State<Child2Page> {
  String value = "Page 2";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ],
      ),
    );
  }
}