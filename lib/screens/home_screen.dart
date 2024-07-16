import 'package:flutter/material.dart';
import 'package:kirana/component/latest_card.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Icon(
            Icons.dashboard,
            size: 35,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          children: [
            Row(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.data_array,
                        size: 35,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("My Bills"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Activity",
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
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                  CustomCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
