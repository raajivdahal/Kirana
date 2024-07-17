import 'package:flutter/material.dart';
import 'package:kirana/component/dashed_container.dart';
import 'package:kirana/screens/home_screen.dart';

class UploadbillScreen extends StatefulWidget {
  const UploadbillScreen({super.key});

  @override
  State<UploadbillScreen> createState() => _UploadbillScreenState();
}

class _UploadbillScreenState extends State<UploadbillScreen> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DashBoard()))),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: EdgeInsets.only(right: 25),
            child: Text("Save"),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 22),
            decoration: InputDecoration(
                hintText: "Bill Name", contentPadding: EdgeInsets.all(20)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: DashedBorderContainer(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.photo), Text("Add a receipt")],
                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 28,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Jul 17, 2024",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          // TextField(
          //   maxLines: 4,
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.create),
          //   ),
          // )
        ],
      ),
    );
  }
}
