import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/mybills_screen.dart';
import 'package:kirana/screens/setting.dart';
// import 'package:kirana/component/temp2.dart';
import 'package:kirana/screens/sign_in.dart';
import 'package:kirana/screens/signup_screen.dart';
import 'package:kirana/screens/uploadbill_screen.dart';

// import 'package:kirana/test/stack.dart';
// import 'screens/signup_screen.dart';
// import 'screens/verifyotp_screen.dart';
// import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UploadbillScreen(),
  ));
}
