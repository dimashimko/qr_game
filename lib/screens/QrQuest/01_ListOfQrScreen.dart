import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';
import 'package:qr_game/screens/ScannerScreen.dart';
import 'package:qr_game/utilities/save_load_Data.dart';
import 'package:qr_game/widgets/qrItem.dart';

class ListOfQrScreen extends StatefulWidget {
  QrGame game = QrGame(0, 0);

  // constructor
  ListOfQrScreen(QrGame g) {
    game = g;
    saveData('qq', json.encode(game)); // save data when new game is created
  }

  @override
  _ListOfQrScreenState createState() => _ListOfQrScreenState();
}

class _ListOfQrScreenState extends State<ListOfQrScreen> // for to redraw items
    with
        WidgetsBindingObserver {
  String textOnAppBar = 'ListOfQrScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'List Of Qr  Found: [${widget.game.getNumberOfFoundCodes()}/ ${widget.game.quantity}]'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemCount: widget.game.quantity,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            // width: 160,
            // height: MediaQuery.of(context).size.height / 7,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle,
              color: Colors.black12,
            ),
            child: qrItem(context, widget.game, index, goToScannerCallBack),
          ),
        ),
      ),
    );
  }

  goToScannerCallBack(int index) {
    _goToQrScanner(context, index);
  }

  void _goToQrScanner(BuildContext context, int index) async {
    Route routeToScanner = MaterialPageRoute(
        builder: (context) => QRViewExample(
              widget.game.list[index].number,
            ));

    final result = await Navigator.push(context, routeToScanner);
    print('Returned');
    int number = int.tryParse(result) ?? -1;

    setState(() {
      if (number == widget.game.list[index].number) {
        widget.game.list[index].isFound = true;
        saveData('qq', json.encode(widget.game));
      }
    });
  }


/*  @protected
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
  }*/

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    print('************ ListOfQrScreen didChangeAppLifecycleState  ************');
  }

  @override
  void didChangeMetrics() {
    setState(() {});
    print('************ ListOfQrScreen didChangeMetrics  ************');

    // This will be triggered by changes in orientation.
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    print('************ ListOfQrScreen initState  ************');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // WidgetsBinding.instance.addObserver(this);
    print('************ ListOfQrScreen didChangeDependencies  ************');
  }

  @override
  void deactivate() {
    saveData('qq', json.encode(widget.game));

    super.deactivate();
    print('************ ListOfQrScreen deactivate  ************');
  }

  @override
  void dispose() {
    // saveData('qq', json.encode(widget.game));

    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print('************ ListOfQrScreen dispose  ************');
  }
}

void didChangeAppLifecycleState(AppLifecycleState state) {
  print('************ ListOfQrScreen didChangeAppLifecycleState  ************');
}
