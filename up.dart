import 'package:flutter/material.dart';

enum Category { sale, purchase }

class UploadbillScreen extends StatefulWidget {
  const UploadbillScreen({super.key});

  @override
  State<UploadbillScreen> createState() => _UploadbillScreenState();
}

List<String> options = ["Sale", "Purchase"];

class _UploadbillScreenState extends State<UploadbillScreen> {
  // final Category _category = Category.purchase;
  DateTime? d;
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 116, 66),
        centerTitle: true,
        title: const Text(
          "Upload Bill",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: options[0],
                        groupValue: currentOption,
                        onChanged: (value) {
                          setState(() {
                            currentOption = value.toString();
                          });
                        },
                      ),
                      const Text("Sale"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: options[1],
                        groupValue: currentOption,
                        onChanged: (value) {
                          setState(() {
                            currentOption = value.toString();
                          });
                        },
                      ),
                      const Text("Purchase"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2005),
                    initialEntryMode: DatePickerEntryMode.input,
                  );
                  if (date != null) {
                    d = date;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                    ),
                    height: 55,
                    width: double.infinity,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Remarks",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Customer Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                    ),
                    height: 55,
                    width: double.infinity,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Photo",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.photo,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blue,
                    ),
                    height: 55,
                    width: double.infinity,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.upload,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
