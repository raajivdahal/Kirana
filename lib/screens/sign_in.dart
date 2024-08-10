import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:kirana/component/custom_button.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/reset_screen.dart';
import 'package:kirana/screens/signup_screen.dart';
import 'package:kirana/screens/verifyotp_screen.dart';
import 'package:kirana/util/form_validate.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kirana/services//constant.dart';

final _signInformKey = GlobalKey<FormState>();

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializedSharedPref();
  }

  void initializedSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    print("Login User");
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(
        Uri.parse("http://$localIP:9191/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      var json = jsonDecode(response.body);

      var token;
      if ((json["status"])) {
        token = json["accessToken"];

        prefs.setString("accessToken", token);
        
        print(prefs.getString("accessToken"));
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DashBoard(


                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    key: _signInformKey,
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Welcome !",
                        //           style: TextStyle(
                        //             fontSize: 32,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height: 7,
                        //         ),
                        //         Text(
                        //           "Sign in to Continue.",
                        //           style: TextStyle(
                        //             fontSize: 20,
                        //             color: Colors.grey,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                              label: Text("Email ID"),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            // validator: (value) =>
                            //     !validateEmail(value!) ? "Invalid Email" : null,
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: TextFormField(
                            // validator: (value) => value!.length < 3
                            //     ? "Should be greater than 3"
                            //     : null,

                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                              label: Text("Password"),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => ResetScreen())),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            child: const CustomButton(
                              text: "Login",
                            ),
                            onTap: () => {
                                  loginUser()

                                  // if (_signInformKey.currentState!.validate())
                                  //   {
                                  //     Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const OTPScreen(),
                                  //       ),
                                  //     ),
                                  //   }
                                }),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Didn't have account? "),
                            GestureDetector(
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
