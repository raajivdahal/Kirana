import 'package:flutter/material.dart';
import 'package:kirana/component/signin_text_field.dart';

import 'custom_button.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  SignInTextField(
                    label: "Full Name",
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SignInTextField(
                    label: "Mobile Number",
                    icon: Icon(Icons.phone),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
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
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.password),
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
                    height: 25,
                  ),
                  CustomButton(
                    text: "Login",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
