import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kirana/component/dashed_container.dart';
import 'package:kirana/screens/home_screen.dart';

class UploadbillScreen extends StatefulWidget {
  const UploadbillScreen({super.key});

  @override
  State<UploadbillScreen> createState() => _UploadbillScreenState();
}

class _UploadbillScreenState extends State<UploadbillScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  File? _selectedImage;
  String? imageStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DashBoard()),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: const EdgeInsets.only(right: 25),
            child: const Text("Save"),
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
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: DashedBorderContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.photo), Text("Add a receipt")],
                  ),
                ),
              ),
            ),
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);

                          _pickImageFromGallary();
                        },
                        leading: Icon(Icons.photo),
                        title: Text('Select from Gallery'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _pickImageFromCamera();
                        },
                        leading: Icon(Icons.camera),
                        title: Text('Select from Camera'),
                      ),
                    ],
                  );
                }),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.category,
                      size: 28,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Bill Type",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add notes",
                prefixIcon: Icon(Icons.create),
              ),
            ),
          ),
          // TextField(
          //   maxLines: 4,
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.create),
          //   ),
          // )

          SizedBox(
            height: 25,
            child: Text("Selected Image"),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child:
                _selectedImage != null ? Image.file(_selectedImage!) : Text(""),
          )
        ],
      ),
    );
  }

  Future _pickImageFromGallary() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _selectedImage = File(image.path);
    });
  }

  void _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _selectedImage = File(image.path);

      print(_selectedImage);
    });
    final camImage =
        await GallerySaver.saveImage(image.path, albumName: "Media");

    print(camImage);
  }
}
