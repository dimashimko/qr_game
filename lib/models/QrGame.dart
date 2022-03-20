import 'dart:math';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

// flutter packages pub run build_runner build
part '../utilities/QrGame.g.dart';

@JsonSerializable()
class QrGame {
  int quantity = 20;
  int range = 3;
  List<QrCode> list =
      List.generate(0, (index) => QrCode(number: 0, isFound: false));

  // constructor
  QrGame(this.quantity, this.range) {
    this._generateList();
  }

  factory QrGame.fromJson(Map<String, dynamic> json) => _$QrGameFromJson(json);

  Map<String, dynamic> toJson() => _$QrGameToJson(this);

  List<QrCode> _generateList() {
    list = List<QrCode>.filled(quantity, QrCode(number: 0, isFound: false));
    var random = Random();
    for (int i = 0; i < list.length; i++) {
      var newInt = 0;

      for (int j = 0; j < 10; j++) {
        newInt = random.nextInt(range + 1);
        if (i == 0) break;
        if (newInt != list[i - 1].number) break;
      }

      // list[i] = QrCode(number:newInt, isFound: false);
      list[i] = QrCode(number: newInt, isFound: false);
    }
    return list;
  }

  int getNumberOfFoundCodes() {
    int foundCodes = 0;
    for (var l in list) {
      if (l.isFound) foundCodes++;
    }
    return foundCodes;
  }

  List<QrCode> getList() => list;
}

@JsonSerializable()
class QrCode {
  int number = 0;
  bool isFound = false;

  QrCode({required this.number, required this.isFound});

  factory QrCode.fromJson(Map<String, dynamic> json) => _$QrCodeFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeToJson(this);

  @override
  String toString() {
    // return super.toString();
    return 'number:$number isFound:$isFound';
  }
}

void main() {
  print('hi hi');
  QrGame qg = QrGame(3, 10);
  print('json.encode(qg): ${json.encode(qg)}');
  QrGame newQg = QrGame.fromJson(json.decode(
      '{"quantity":3,"range":10,"list":[{"number":8,"isFound":false},{"number":6,"isFound":false},{"number":2,"isFound":false}]}'));
  print(newQg.quantity);
  print(newQg.range);
  print(newQg.list);
}
