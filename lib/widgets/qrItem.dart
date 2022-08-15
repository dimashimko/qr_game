import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';

Widget qrItem(context, QrGame game, int index, ValueChanged<int> goToScanner) {
  // double widthBlock = MediaQuery.of(context).size.width/4;
  // double widthBlock = 70;
  // print('widthBlock: $widthBlock');
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('asset/images/qrQuestion.png'),
          ),
          SizedBox(width: 64,),
          Text(
            '${game.list[index].number}',
          ),
        ],
      ),
      getActionButton(
          index.compareTo(game.getNumberOfFoundCodes()), goToScanner, index),
    ],
  );
}

Widget getActionButton(
    int numOfStyle, ValueChanged<int> goToScanner, int index) {
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
