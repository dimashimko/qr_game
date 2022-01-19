
// counts the number of digits that make up a number
//   7 - 1
//  13 - 2
//  56 - 2
// 998 - 3
int countDigits(int num) {
  if (num == 0) return 1;
  if (num < 0) num *= -1;
  int counter = 0;
  while (num > 0) {
    num = num ~/ 10;
    counter++;
  }
  return counter;
}