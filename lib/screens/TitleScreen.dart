import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'QrQuest/01_MenuScreen.dart';

class TitleScreen extends StatefulWidget {
  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    int widthButtonPercent = 70;
    double widthOfButton =
        MediaQuery.of(context).size.width * (widthButtonPercent / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).name_game),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                child: Text(S.of(context).activity_games_with_scanner),
              ),
            ),

            // 01 QrQuest
            ElevatedButton(
                child: Container(
                  width: widthOfButton,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).game_qr_quest),
                ),
                onPressed: () => _goToQrQuest(context)),
            SizedBox(
              height: 8.0,
            ),

            // 02 NumericalQuest
            ElevatedButton(
                child: Container(
                  width: widthOfButton,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).game_numerical_quest),
                ),
                onPressed: null),
            SizedBox(
              height: 8.0,
            ),

            // 03 CaptureTheFlag
            ElevatedButton(
                child: Container(
                  width: widthOfButton,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).capture_the_flag,
                  ),
                ),
                onPressed: null),
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
    Route routeToQrQuest =
        MaterialPageRoute(builder: (context) => MenuScreen());
    Navigator.push(context, routeToQrQuest);
  }
}
