import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';

Widget qrItem(context, QrGame game, int index, ValueChanged<int> goToScanner) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
/*          Text(
            '${index + 1}',
          ),
          SizedBox(
            width: 8,
          ),*/
          Image(
            image: AssetImage('asset/images/qrQuestion.png'),
          ),
        ],
      ),
      Text(
        '${game.list[index].number}',
      ),
      getWidget(
          index.compareTo(game.getNumberOfFoundCodes()), goToScanner, index),

/*      ElevatedButton(
        onPressed: () {
          if (game.getNumberOfFoundCodes() == index) {
            goToScanner(index);
          }
        },
        child: Row(
          children: [
            Text(
              game.list[index].isFound ? 'Found ' : 'Find ',
            ),
            Icon(game.list[index].isFound ? Icons.check : Icons.arrow_forward),
          ],
        ),
        style: getButtonStyle(index.compareTo(game.getNumberOfFoundCodes())),
      ),*/
    ],
  );
}

// style: ElevatedButton.styleFrom(
// primary: game.list[index].isFound ? Colors.green : Colors.blue,
// primary: getColor(game.getNumberOfFoundCodes(), index),
// ),

Widget getWidget(int numOfStyle, ValueChanged<int> goToScanner, int index) {
  if (numOfStyle < 0) {
    // -1
    return Row(
      children: [
        Text('Found '),
        Icon(
          Icons.check,
          color: Color(0xFF995511),
        ),
      ],
    );
  } else if (numOfStyle == 0) {
    // = 0
    return ElevatedButton(
      onPressed: () {
        goToScanner(index);
      },
      child: Row(
        children: [
          Text(
            'Find ',
          ),
          Icon(
            Icons.arrow_forward,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF995511),
        side: BorderSide(
          width: 5.0,
          color: Color(0xFF995511),
        ),
      ),
    );
  }
  // +1
  return SizedBox(width: 20);
}

/*ButtonStyle getButtonStyle(int numOfStyle) {
  if (numOfStyle < 0) {
    return ElevatedButton.styleFrom(
      primary: Color(0xFF995511),
    );
  } else if (numOfStyle == 0) {
    return ElevatedButton.styleFrom(
      primary: Color(0xFF995511),
      side: BorderSide(width: 5.0, color: Color(0xFF995511)),
    );
  }
  return ElevatedButton.styleFrom(
    primary: Colors.grey,
  );
}*/

// String numberToString( int num) {}
