import 'package:flutter/material.dart';
import 'package:kirana/util/randomNumber.dart';

class MybillsScreen extends StatelessWidget {
  const MybillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime startDate, endDate;

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
                    child: Row(
                      children: [
                        const Text(
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
              Container(
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
              )
            ]),
          ),
          ListTile(
            tileColor: Colors.grey[300],
            // tileColor: Colors.grey,
            leading: Text(
              "Bill Num",
              style: TextStyle(fontSize: 16),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Text(
                "Bill Type",
                style: TextStyle(),
              ),
            ),
            trailing: Text(
              "Download",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                List<String> s = ["Sales", "Purchase"];

                String Rtype = s[randomNum()];

                return ListTile(
                  // tileColor: Colors.grey,
                  leading: Text(
                    "Bill Num",
                    style: TextStyle(fontSize: 16),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text(
                      Rtype,
                      style: TextStyle(),
                    ),
                  ),
                  trailing: Icon(Icons.download),
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
