import 'package:flutter/material.dart';

class MybillsScreen extends StatelessWidget {
  const MybillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Bills"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
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
                        "From Date of Sale",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 8),
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
                        "To Date of Sale",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 8),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("Drop Down")),
                TextButton(onPressed: () {}, child: Text("Filter"))
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text("Bill Num"),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Bill Type"),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Download"),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(6, (index) {
                    return TableRow(children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Cell ${++index}"),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Cell ${++index}"),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Cell ${++index}"),
                        ),
                      ),
                    ]);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
