import 'dart:convert';

import 'package:file/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService extends ChangeNotifier {
  Future<ServerConnectionModel?> getServer() async {
    final http.Response response = await http.post(
        Uri.parse("https://test-atre-server-v2.up.railway.app/server"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        print(result);
        notifyListeners();
        return serverConnectionModelFromJson(response.body);
      } else {
        return serverConnectionModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
