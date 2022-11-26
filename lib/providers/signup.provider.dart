import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider with ChangeNotifier {
  int _count = 0;
  int floatValue = 1;
  Future<dynamic> fetchData(pageNumber) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', 'token1');
    final url = Uri.parse("https://reqres.in/api/users?page=$pageNumber");
    // return http.get(url).then((response) {
    //   if (response.statusCode == 200) {
    //     final body = json.decode(response.body);
    //     print(body);
    //   } else {
    //      throw "Something went wrong";
    //   }
    // }).catchError((error) {
    //   print(error);
    // });
    try {
      final response = await http.get(url);
      //final token = prefs.getString('token');
      if (response.statusCode != 200) {
        throw "Something went wrong";
      }
      return json.decode(response.body);
    } catch (error) {
      rethrow;
    }
  }

  void increment() {
    _count = _count + 1;
    notifyListeners();
  }

  int get count {
    return _count;
  }
}
