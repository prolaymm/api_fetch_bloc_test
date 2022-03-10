import 'dart:convert';

import 'package:bloc_api_handling/core/model/user_model.dart';
import 'package:http/http.dart' as http;



class Service {
  late String BASE_URL = "https://jsonplaceholder.typicode.com/users";

  Service();

  Future<List<UserModel>> getAllUser() async {
    try {
      http.Response response = await http.get(Uri.parse(BASE_URL));

      if (response.statusCode == 200) {
        List<UserModel> userData = userModelFromJson(response.body);
        print("api fectch data working");
        return userData;
      } else {
        print("error");
        return [];
      }
    } catch (e) {

      print("aj error ${e.toString()}");
      return [];
    }
  }
}
