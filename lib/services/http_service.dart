import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kirana/services/constant.dart';

class ImageService {
  Future<String> uploadPhotos(List<String> paths) async {
    Uri uri = Uri.parse('http://10.0.0.103:5000/profile/upload-mutiple');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    for (String path in paths) {
      request.files.add(await http.MultipartFile.fromPath('files', path));
    }

    http.StreamedResponse response = await request.send();
    var responseBytes = await response.stream.toBytes();
    var responseString = utf8.decode(responseBytes);
    print('\n\n');
    print('RESPONSE WITH HTTP');
    print(responseString);
    print('\n\n');
    return responseString;
  }

  Future<bool> uploadImageToServer(File? selectedImage) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://$localIP:9191/upload'),
    );
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      selectedImage!.path,
    ));
    request.headers.addAll({
      'Content-Type': "application/json",
    });
    request.fields['bill_num'] = "45879";
    // request.fields['bill_type'] = selectedValue;
    request.fields['bill_name'] = "abc company";
    // request.fields['created_date'] = createdDate.toString();

    var response = await request.send();

    if (response.statusCode == 200) {
      print("done");
      return true;
    } else {
      // Handle error
      print('error uploading image to the server');

      return true;
    }

    // var request = await http.get(Uri.parse("http://10.0.2.2:3000/data"));

    // if (request.statusCode == 200) {
    //   var json = jsonDecode(request.body);
    //   print(json);
    // }
  }
}
