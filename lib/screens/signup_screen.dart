import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kirana/component/custom_button.dart';
import 'package:kirana/component/signin_text_field.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: [
                    const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "Create Account",
                    //           style: TextStyle(
                    //             fontSize: 32,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //           "Sign up to get started.",
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //             color: Colors.grey,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 35,
                    ),

                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          SignInTextField(
                            label: "Full Name",
                            icon: Icon(Icons.person),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SignInTextField(
                              label: "Mobile Number", icon: Icon(Icons.phone)),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.email),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
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
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.password),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
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
                            height: 25,
                          ),
                          GestureDetector(
                            child: CustomButton(
                              text: "Done",
                            ),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashBoard(),
                                )),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have account?"),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
