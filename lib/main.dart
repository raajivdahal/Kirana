import 'package:flutter/material.dart';
// import 'package:kirana/component/temp2.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/mybills_screen.dart';
import 'package:kirana/screens/sign_in.dart';
import 'package:kirana/screens/signup_screen.dart';
import 'package:kirana/screens/test.dart';
import 'package:kirana/screens/uploadbill_screen.dart';
import 'package:kirana/test/stack.dart';

import 'screens/home_screen.dart';
// import 'screens/signup_screen.dart';
// import 'screens/uploadbill_screen.dart';
// import 'screens/verifyotp_screen.dart';
// import 'screens/login_screen.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom]);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpScreen(),
  ));
}
