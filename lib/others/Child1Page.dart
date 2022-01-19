import 'package:flutter/material.dart';

class Child1Page extends StatefulWidget {
  final String title;
  final ValueChanged<String> parentAction;

  //or
  //final void Function(String value) parentAction;

  const Child1Page({
    Key key,
    this.title,
    this.parentAction,
  }) : super(key: key);

  @override
  Child1PageState createState() => Child1PageState();
}

class Child1PageState extends State<Child1Page> {
  String value = "Page 1";

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
          RaisedButton(
            child: Text("Action 2"),
            onPressed: () {
              widget.parentAction("Update from Child 1");

            },
          ),
          RaisedButton(
            child: Text("Action 3"),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text("Action 4"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
