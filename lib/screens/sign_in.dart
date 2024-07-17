import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:kirana/component/custom_button.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: TextField(
                          decoration: InputDecoration(
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
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        child: CustomButton(
                          text: "Login",
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DashBoard(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't have account? "),
                          GestureDetector(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            )),
                          )
                        ],
                      ),
                    ],
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
