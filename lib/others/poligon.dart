import 'package:qr_game/utilities/countDigits.dart';

void main() {
  // print(countDigits(0));
  String  s = 'a';
  var shared = List.filled(3, s);
  // shared[0] = [5];
  shared[1]='b';
  // shared[1] = false;
  print(shared);

  print(shared[0]);
  print(shared[1]);
  print(shared[2]);
}
