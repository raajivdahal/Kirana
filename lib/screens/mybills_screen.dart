import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kirana/util/randomNumber.dart';

class MybillsScreen extends StatefulWidget {
  const MybillsScreen({super.key});

  @override
  State<MybillsScreen> createState() => _MybillsScreenState();
}

class _MybillsScreenState extends State<MybillsScreen> {
  List items = [];

  @override
  void initState() {
    // readJson();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(children: [
              const SizedBox(
                height: 35,
              ),
              const Row(
                children: [
                  Text(
                    "My Bills",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    child: const Text(
                      "Day",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Week",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Month",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          "Type",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        // Icon(Icons.check_outlined)
                      ],
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
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  readJson();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: const Text(
                    "Filter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ),
          ListTile(
            tileColor: Colors.grey[300],
            // tileColor: Colors.grey,
            leading: const Text(
              "Bill Num",
              style: TextStyle(fontSize: 16),
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Text(
                "Bill Type",
                style: TextStyle(),
              ),
            ),
            trailing: const Text(
              "Download",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                final item = items[index];
                String billNum = item["billNumber"].toString();
                String billType = item["billType"];
                print(billNum);
                // List<String> s = ["Sales", "Purchase"];

                // String Rtype = s[randomNum()];

                return ListTile(
                  // tileColor: Colors.grey,
                  leading: Text(
                    billNum,
                    style: TextStyle(fontSize: 16),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Text(
                      billType,
                      style: const TextStyle(),
                    ),
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(Icons.download),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: Colors.grey, // Custom style
                );
              },
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/bills.json');
    final data = await json.decode(response);
    setState(() {
      items = data["bill_receipt"];
      // print(items);
    });
  }
}
