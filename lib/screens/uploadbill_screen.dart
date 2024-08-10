import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kirana/component/dashed_container.dart';
// import 'package:kirana/helper/alert_dialogs.dart';
import 'package:kirana/screens/home_screen.dart';
import 'package:kirana/services/http_service.dart';

class UploadbillScreen extends StatefulWidget {
  const UploadbillScreen({super.key});

  @override
  State<UploadbillScreen> createState() => _UploadbillScreenState();
}

class _UploadbillScreenState extends State<UploadbillScreen> {
  List<XFile>? imageFileList = [];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String cloudUrl = "https://api.cloudinary.com/v1_1/dafxlje45/upload";
  ImageService imageService = ImageService();

  DateTime createdDate = DateTime.now();

  File? _selectedImage;
  String? imageStatus;
  final items = [
    'Sale',
    'Purchase',
  ];
  String selectedValue = 'Sale';

  Future<void> uploadFile(String url, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('file', _selectedImage!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      const AlertDialog(
        title: Text("Success"),
        content: Text("Save successfully"),
      );
    } else {
      // Handle error

      const AlertDialog(
        title: Text("Failed"),
        content: Text("Failed to upload image!"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int? intervalValue = 5;
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
            child: InkWell(
                onTap: () {

                  imageService.uploadImageToServer(_selectedImage);
                },
                child: const Text("Save")),
          )
        ],
      ),
      body: Column(
        children: [
          const TextField(
            style: TextStyle(fontSize: 22),
            decoration: InputDecoration(
                hintText: "Bill Name", contentPadding: EdgeInsets.all(20)),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: DashedBorderContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
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
                          selectMultipleImages();

                          // _pickImageFromGallary();
                        },
                        leading: const Icon(Icons.photo),
                        title: const Text('Select from Gallery'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _pickImageFromCamera();
                        },
                        leading: const Icon(Icons.camera),
                        title: const Text('Select from Camera'),
                      ),
                    ],
                  );
                }),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 28,
                        ),
                        const SizedBox(
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
                  ),
                  onTap: () async {
                    final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2025));

                    if (date != null) {
                      setState(() {
                        createdDate = date;
                      });
                    }
                  },
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.category,
                        size: 28,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),

                        // dropdown below..
                        child: DropdownButton<String>(
                          hint: const Text("Bill Type"),

                          value: selectedValue,
                          onChanged: (newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedValue = newValue;
                                print(selectedValue);
                              });
                            }
                          },
                          items: items
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),

                          // add extra sugar..
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 42,
                          underline: const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(),

          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
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

          const SizedBox(
            height: 25,
            child: Text("Selected Image"),
          ),
          // SizedBox(
          //   width: 200,
          //   height: 200,
          //   child: _selectedImage != null
          //       ? Image.file(_selectedImage!)
          //       : const Text(""),
          // )
          
          Expanded(child: Padding(

          padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: imageFileList!.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(File(imageFileList![index].path),
                    fit: BoxFit.cover,);
                }),
          )
          ),
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

  void selectMultipleImages() async{
    final ImagePicker imagePicker = ImagePicker();

    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();

    print("Image List Length:" + imageFileList!.length.toString());
    setState((){
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
      }
    });
  }
}


