import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text("Jhon Doe"),
                ),
                subtitle: Text("Edit personal details"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Image.network(
                  "https://wallpaperaccess.com/full/2213569.jpg",
                  width: 50,
                  height: 50,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    "Dark Mode",
                    // textAlign: TextAlign.center,
                  ),
                ),
                // trailing: ,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
