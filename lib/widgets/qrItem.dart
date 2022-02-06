import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';

Widget qrItem(context, QrGame game, index, ValueChanged<int> goToScanner) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(
          //   '${index + 1}',
          // ),
          // SizedBox(
          //   width: 8,
          // ),
          Image(
            image: AssetImage('assets/images/qrQuestion.png'),
          ),
        ],
      ),
      Text(
        '${game.list[index].number}',
      ),
      ElevatedButton(
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
        style: ElevatedButton.styleFrom(
          // primary: game.list[index].isFound ? Colors.green : Colors.blue),
          primary: getColor(game.getNumberOfFoundCodes(), index),

        ),
      ),
    ],
  );
}

Color getColor(int numberOfFoundCodes, int index) {
  if (index<numberOfFoundCodes){
    return Colors.blue;
  } else if(index == numberOfFoundCodes){
    return Colors.green;
  }
  return Colors.grey;
}

// String numberToString( int num) {}
