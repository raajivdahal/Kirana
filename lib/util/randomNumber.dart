import 'dart:math';

// int max = 10;

int randomNum({int max = 2}) {
  int randomNumber = Random().nextInt(max);
  return randomNumber;
}
