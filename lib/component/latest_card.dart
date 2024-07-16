import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sale",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text("6.4.18"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text("Bill Num"),
                SizedBox(
                  width: 15,
                ),
                Text("04543"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text("Bill Num:"),
                SizedBox(
                  width: 15,
                ),
                Text("04543"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
