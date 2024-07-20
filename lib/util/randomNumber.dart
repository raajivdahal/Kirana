import 'dart:math';

// int max = 10;

int randomNum({int max = 2}) {
  int randomNumber = Random().nextInt(max);
  return randomNumber;
}

String? validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
