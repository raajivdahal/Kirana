import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'mybills_screen.dart';
import 'uploadbill_screen.dart';

class TestDrawer extends StatelessWidget {
  const TestDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                accountEmail: Text(""),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://mir-s3-cdn-cf.behance.net/project_modules/1400/a4c0b560535613.5a5084d6141fb.jpg"),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DashBoard(),
                  ));
                },
                leading: const Icon(Icons.dashboard_outlined),
                title: const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UploadbillScreen(),
                  ));
                },
                leading: const Icon(Icons.note),
                title: const Text(
                  "Upload Bill",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MybillsScreen(),
                  ));
                },
                leading: const Icon(Icons.safety_check),
                title: const Text(
                  "My Bills",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) {},
                  // ));
                },
                leading: const Icon(Icons.logout),
                title: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
    );
  }
}
