import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ListTile(
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text(
                        "Change Password",
                        style: TextStyle(),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text(
                        "Privacy",
                        style: TextStyle(),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        "Notifications",
                        style: TextStyle(),
                      ),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text(
                        "App Notification",
                        style: TextStyle(),
                      ),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.more),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "More",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        "Notifications",
                        style: TextStyle(),
                      ),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      title: Text(
                        "App Notification",
                        style: TextStyle(),
                      ),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text("Log Out"),
                ],
              )
            ],
          )),
    );
  }
}
