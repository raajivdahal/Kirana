import 'package:flutter/material.dart';
import 'package:kirana/component/custom_drawer.dart';
import 'package:kirana/component/latest_card.dart';
import 'package:kirana/screens/mybills_screen.dart';
import 'package:kirana/screens/setting.dart';
import 'package:kirana/screens/uploadbill_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Icon(
              Icons.dashboard,
              size: 35,
            ),
          ),
          onTap: () => scaffoldKey.currentState?.openDrawer(),
        ),
        // IconButton(
        //   padding: EdgeInsets.only(left: 30),
        //   // color: Colors.red,
        //   icon: const Icon(
        //     Icons.dashboard,
        //     size: 35,
        //   ),
        //   onPressed: () => scaffoldKey.currentState?.openDrawer(),
        // ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                child: const Icon(Icons.settings),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingScreen()),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello User,",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("Your total bills"),
                  ],
                ),
                Text(
                  "316",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: const Column(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.upload_file,
                              size: 35,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Upload Bill"),
                          ],
                        ),
                      ],
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UploadbillScreen())),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  GestureDetector(
                    child: const Column(
                      children: [
                        Icon(
                          Icons.data_array,
                          size: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "My Bills",
                        ),
                      ],
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MybillsScreen(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest activity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text("6.4.19-5.4.19"),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.calendar_month),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                  // CustomCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
