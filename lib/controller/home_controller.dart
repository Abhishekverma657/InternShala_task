import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:internshala_assignment/model/DataUser.dart';
import '../model/DataModel.dart';

class HomeController extends GetxController {
  Future<DataUser> getDetails() async {
    final response =
        await get(Uri.parse('https://internshala.com/flutter_hiring/search'));
    var userData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.bod);
      return DataUser.fromJson(userData);
    }
    return DataUser.fromJson(userData);
  }
}
