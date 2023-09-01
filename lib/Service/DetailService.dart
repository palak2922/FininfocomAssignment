import 'dart:convert';
import 'dart:io';
import 'package:fininfocom/Model/UserModel.dart';
import 'package:http/http.dart' as http;




class Detailservice{

  dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        print('unauthorized err ${jsonDecode(response.body)}');
        throw HttpException('Unauthorized');
      default:
        print('got err response from handler ${jsonDecode(response.body)}');
        throw HttpException('Failed to get details');
    }
  }

  Future GetDogDetails() async {
    try {
      var response = await http.get(
        Uri.parse('https://dog.ceo/api/breeds/image/random'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final responseData = handleResponse(response);
      return responseData['message'];
    }
    catch (err) {
      throw err;
    }
  }


  Future<User> GetUserDetails() async {
      var response = await http.get(
        Uri.parse('https://randomuser.me/api/'),
      );

      if(response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
      throw Exception('Some Error Occurred');
  }

}
