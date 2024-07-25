import 'package:flutter/material.dart';

void displayAlert(context, String status) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(status),
        // content:
        //     const Text("Image has been uploaded to the server successfully"),
        actions: <Widget>[
          TextButton(
            // Use TextButton instead of FlatButton
            child: const Text("Okay"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // TextButton(
          //   // Use TextButton instead of FlatButton
          //   child: const Text("SETTINGS"),
          //   onPressed: () {},
          // ),
        ],
      );
    },
  );
}
