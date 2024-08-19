import "dart:typed_data";
import "dart:ui" as ui;

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:image_gallery_saver/image_gallery_saver.dart";
import "package:kirana/style/text_style.dart";

class DetailScreen extends StatelessWidget {
  final String? billNum;
  GlobalKey _receiptKey = GlobalKey();
  DetailScreen({super.key, this.billNum});

  Future<void> _captureAndSaveInvoice() async {
    try {
      RenderRepaintBoundary boundary = _receiptKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List uint8list = byteData!.buffer.asUint8List();

      // Save the image to the gallery
      final result = await ImageGallerySaver.saveImage(uint8list);
      print('Image saved to gallery: $result');

      // Alternatively, save to local storage
      // final directory = await getApplicationDocumentsDirectory();
      // final file = File('${directory.path}/invoice.png');
      // await file.writeAsBytes(uint8list);
      // print('Image saved to ${file.path}');
    } catch (e) {
      print('Error capturing invoice: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.blue, borderRadius: BorderRadius.circular(10),
                ),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            RepaintBoundary(
              key: _receiptKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bill Number: $billNum",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "From: Name",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "0/4/2023",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Bill Detail",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type",
                        style: billTextStyle(),
                      ),
                      Text(
                        "Expense",
                        style: billTextStyle(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Particulars",
                        style: billTextStyle(),
                      ),
                      Text(
                        "Audit",
                        style: billTextStyle(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: billTextStyle(),
                      ),
                      Text(
                        "Rs 25,450",
                        style: billTextStyle(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "VAT",
                        style: billTextStyle(),
                      ),
                      Text(
                        "Rs 1,560",
                        style: billTextStyle(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      Text(
                        "Rs 55,560",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _captureAndSaveInvoice();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Print Receipt",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
