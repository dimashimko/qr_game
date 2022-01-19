import 'package:flutter/material.dart';
import 'QrQuest/01_QrQuest.dart';
import 'QrQuest/01_SettingScreen.dart';

class TitleScreen extends StatefulWidget {
  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  String text = 'Party games:';
  int widthButtonPercent = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(child: Text(text),),
            ),

            // 01 QrQuest
            ElevatedButton(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      (widthButtonPercent / 100),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'QrQuest',
                  ),
                ),
                onPressed: () => _goToQrQuest(context)),
            SizedBox(
              height: 8.0,
            ),

            // 02 NumericalQuest
            ElevatedButton(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      (widthButtonPercent / 100),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'NumericalQuest',
                  ),
                ),
                onPressed: () {}),
            SizedBox(
              height: 8.0,
            ),

            // 03 CaptureTheFlag
            ElevatedButton(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      (widthButtonPercent / 100),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CaptureTheFlag',
                  ),
                ),
                onPressed: () {}),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  // 01 QrQuest
  void _goToQrQuest(BuildContext context) async {
    Route routeToQrQuest = MaterialPageRoute(builder: (context) => QrQuest());
    Navigator.push(context, routeToQrQuest);
  }
}
