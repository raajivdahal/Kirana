import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kirana/services/constant.dart';

class AuthService {
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

  //Login User and save access token using shared preferences

  // void loginUser( String email, String password) async {
  //   print("Login User");
  //   if (emailisNotEmpty && password.isNotEmpty) {
  //     var reqBody = {
  //       "email": email,
  //       "password": password
  //     };

  //     var response = await http.post(
  //       Uri.parse("http://$localIP:9191/login"),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(reqBody),
  //     );

  //     var json = jsonDecode(response.body);

  //     var token;
  //     if ((json["status"])) {
  //       token = json["accessToken"];

  //       prefs.setString("accessToken", token);

  //       print(prefs.getString("accessToken"));
  //     }
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => DashBoard()));
  //   }
  // }

  Future<void> register(
    String fullName,
    String email,
    String password,
    String mobileNum,
  ) async {
    var url = Uri.parse("http://$localIP:9191/register");

    var response = await http.post(url, body: {
      "email": email,
      "password": password,
      "fullName": fullName,
      "mobileNum": mobileNum,
    });

    if (response.statusCode == 200) {
      print("User $fullName registered successfully");
    } else {
      print("error registering user");
    }
  }
}
