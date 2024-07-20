import 'package:flutter/material.dart';
import 'package:kirana/component/custom_button.dart';
import 'package:kirana/component/signin_text_field.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/screens/sign_in.dart';
import 'package:kirana/screens/verifyotp_screen.dart';
import 'package:kirana/util/form_validate.dart';

final _signUpFormKey = GlobalKey<FormState>();

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

                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            // const SignInTextField(
                            //   label: "Full Name",
                            //   icon: Icon(Icons.person),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                  border: OutlineInputBorder(),
                                  label: Text("Full Name"),
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) =>
                                    (value!.isEmpty || value.length < 3)
                                        ? "Please Enter Full Name"
                                        : null,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                  border: OutlineInputBorder(),
                                  label: Text("Mobile Number"),
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) => validateMobile(value!),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            // const SignInTextField(
                            //     label: "Mobile Number",
                            //     icon: Icon(Icons.phone)),

                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: TextFormField(
                                decoration: const InputDecoration(
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
                                validator: (value) => validateEmail(value!)
                                    ? null
                                    : "Enter valid email",
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: TextFormField(
                                validator: (value) =>
                                    value!.isEmpty || value.length < 3
                                        ? "Enter the Password"
                                        : null,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.lock),
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
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                                child: const CustomButton(
                                  text: "Done",
                                ),
                                onTap: () => {
                                      if (_signUpFormKey.currentState!
                                          .validate())
                                        {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const DashBoard(),
                                              )),
                                        }
                                    }),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have account?"),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    child: const Text(
                                      "Sign in",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () => {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const OTPScreen(),
                                            ),
                                          ),
                                        }),
                              ],
                            )
                          ],
                        ),
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
