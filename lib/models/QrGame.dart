import 'dart:math';

import 'package:qr_game/models/QrCode.dart';

class QrGame {
  int quantity = 20;
  int range =3;
  List<QrCode> list = List.generate(0, (index) => QrCode(number:0, isFound: false));


  // constructor
  QrGame(this.quantity, this.range){
    this._generateList();
  }

  List<QrCode> _generateList() {
    list = List<QrCode>.filled(quantity, QrCode(number:0, isFound: false));
    var random = Random();
    for(int i = 0; i<list.length; i++){
      var newInt = 0;

      for(int j = 0; j<10; j++){
        newInt = random.nextInt(range+1);
        if(i == 0) break;
        if(newInt != list[i-1].number) break;
      }

      // list[i] = QrCode(number:newInt, isFound: false);
      list[i] = QrCode(number:newInt, isFound: false);
    }
    return list;
  }

  int getNumberOfFoundCodes(){
    int foundCodes = 0;
    for (var l in list) {
      if(l.isFound) foundCodes++;
    }
    return foundCodes;
  }

  List<QrCode> getList() => list;
}

void main (){
  var game = QrGame(20, 10);
  List<QrCode> list = game._generateList();

  print('print 2');
  for (var c in list) {
    print('number = ${c.number}; isFound = ${c.isFound} ');
  }
}
