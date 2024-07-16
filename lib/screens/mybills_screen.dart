import 'package:flutter/material.dart';

class MybillsScreen extends StatelessWidget {
  const MybillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime startDate, endDate;

    return Scaffold(
      // backgroundColor: Colors.green,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    "Bills",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "Day",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Week",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Month",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Bill Type",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Start Date",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Start Date",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Text(
                  "Filter",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          // ListTile(
          //   tileColor: Colors.red,
          //   title: Text("hello world"),
          // ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  // tileColor: Colors.grey,
                  leading: Text("Kathmandu"),
                  title: Text("hello"),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: Colors.grey, // Custom style
                );
              },
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
