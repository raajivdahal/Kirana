import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kirana/screens/detail_screen.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/mybills_screen.dart';
import 'package:kirana/screens/setting.dart';
// import 'package:kirana/component/temp2.dart';
import 'package:kirana/screens/sign_in.dart';
import 'package:kirana/screens/signup_screen.dart';
import 'package:kirana/screens/uploadbill_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:kirana/test/stack.dart';
// import 'screens/signup_screen.dart';
// import 'screens/verifyotp_screen.dart';
// import 'screens/login_screen.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp(
    accessToken: prefs.getString("accessToken"),
  ));
}

class MyApp extends StatelessWidget {
  final accessToken;

  const MyApp({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadbillScreen()
      // (accessToken != null && JwtDecoder.isExpired(accessToken) == false)
      //     ? DashBoard(
      //
      //       )
      //     : SignInScreen(),

      ,
      routes: {
        // "/": (context) => DashBoard(),
        "/mybills": (context) => MybillsScreen(),
      },
    );
  }
}
