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
  DateTime selectedDate = DateTime.now();
  DateTime? startDate, endDate;
  final billType = [
    'Sale',
    'Purchase',
  ];
  String selectedValue = 'Sale';

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
            // height: 300,
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
                  SizedBox(
                    width: 45,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,

                      hint: const Text("Bill Type"),

                      value: selectedValue,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        }
                      },
                      items: billType
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ))
                          .toList(),

                      // add extra sugar..
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 25,
                      underline: const SizedBox(),
                    ),

                    // const Row(
                    //   children: [
                    //     Text(
                    //       "Type",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10)),

                  //   // dropdown below..
                  //   child: DropdownButton<String>(
                  //     hint: const Text("Bill Type"),

                  //     value: selectedValue,
                  //     onChanged: (newValue) {
                  //       print(newValue);
                  //       if (newValue != null) {
                  //         setState(() {
                  //           selectedValue = newValue;
                  //         });
                  //       }
                  //     },
                  //     items: billType
                  //         .map<DropdownMenuItem<String>>(
                  //             (String value) => DropdownMenuItem<String>(
                  //                   value: value,
                  //                   child: Text(value),
                  //                 ))
                  //         .toList(),

                  //     // add extra sugar..
                  //     icon: const Icon(Icons.arrow_drop_down),
                  //     iconSize: 42,
                  //     underline: const SizedBox(),
                  //   ),
                  // ),

                  OutlinedButton(
                    onPressed: () async {
                      final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025));

                      if (date != null && date != selectedDate) {
                        setState(() {
                          startDate = date;
                        });
                      }
                    },
                    child: const Text(
                      "Start Date",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2018),
                          lastDate: DateTime(2025));

                      if (date != null && date != selectedDate) {
                        setState(() {
                          endDate = date;
                        });
                      }
                    },
                    child: const Text(
                      "End Date",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await readJson();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 8),
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
                ],
              ),
              const SizedBox(
                height: 25,
              ),
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

                // List<String> s = ["Sales", "Purchase"];

                // String Rtype = s[randomNum()];

                return ListTile(
                  // tileColor: Colors.grey,
                  leading: Text(
                    billNum,
                    style: const TextStyle(fontSize: 16),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 85.0),
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
