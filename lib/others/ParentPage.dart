import 'package:flutter/material.dart';
import 'package:qr_game/others/Child1Page.dart';
import 'package:qr_game/others/Child2Page.dart';


class ParentPage extends StatefulWidget {
  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  String myTitle = "My Parent Title";

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _updateMyTitle(String text) {
    setState(() {
      myTitle = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          ListTile(
            title: Text(
              myTitle,
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
            child: Text("Action 1"),
            onPressed: () {},
          ),
          TabBar(
            controller: _controller,
            tabs: [
              Tab(
                text: "First",
                icon: Icon(Icons.check_circle),
              ),
              Tab(
                text: "Second",
                icon: Icon(Icons.crop_square),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Child1Page(
                  parentAction: _updateMyTitle,
                ),
                Child2Page(),
              ],
            ),
          )
        ],
      ),
    );
  }
}