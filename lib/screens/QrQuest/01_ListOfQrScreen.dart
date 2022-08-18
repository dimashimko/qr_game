import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';
import 'package:qr_game/screens/ScannerScreen.dart';
import 'package:qr_game/utilities/save_load_Data.dart';
import 'package:qr_game/widgets/qrItem.dart';

import '../../generated/l10n.dart';

class ListOfQrScreen extends StatefulWidget {
  QrGame game = QrGame(0, 0);
  var callBackRefreshData;

  // constructor
  ListOfQrScreen(this.game, this.callBackRefreshData);

  @override
  _ListOfQrScreenState createState() => _ListOfQrScreenState();
}

class _ListOfQrScreenState extends State<ListOfQrScreen> // for to redraw items
    with
        WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${S.of(context).list_of_qr_found} [${widget.game.getNumberOfFoundCodes()}/ ${widget.game.quantity}]'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: widget.game.quantity,
          separatorBuilder: (context, index) => SizedBox(height: 8),
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
    // _showCongratulationDialog(context);
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
        // additional check?
        widget.game.list[index].isFound = true;
        print('save data when new qr was found');
        saveData(
            'qq', json.encode(widget.game)); // save data when new qr was found
      }
      if (widget.game.getNumberOfFoundCodes() == widget.game.quantity) {
        _showCongratulationDialog(context);
      }
    });
  }

  @override
  void deactivate() {
    if (widget.game.getNumberOfFoundCodes() == widget.game.quantity) {
      print('save data when game over');
      saveData('qq', ''); // save data when game over
    } else {
      print('save data when ListOfQrScreen is close');
      saveData(
          'qq', json.encode(widget.game)); // save data when screen is close
    }

    print('refresh data');
    widget.callBackRefreshData();
    super.deactivate();
    print('************ ListOfQrScreen deactivate  ************');
  }

  void _showCongratulationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          contentPadding: EdgeInsets.only(top: 0.0),
          title: Text(S.of(context).congratulation),
          content: Container(
            padding: EdgeInsets.all(16),
            child: Text(
                '${widget.game.quantity}/${widget.game.quantity} \n${S.of(context).quest_finished} '),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(S.of(context).ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }










  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    print(
        '************ ListOfQrScreen didChangeAppLifecycleState  ************');
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
