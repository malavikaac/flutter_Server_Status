import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ServerStatusWidget extends StatefulWidget {
  @override
  _ServerStatusWidgetState createState() => _ServerStatusWidgetState();
}

class _ServerStatusWidgetState extends State<ServerStatusWidget> {
  bool isServerOn = false;
  var result;

  Future<ServerModel?> dashboardDetails() async {
    final http.Response response = await http.get(
      Uri.parse('http://api.atrehealthtech.com:1400/server'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      result = json.decode(response.body);
      print(response.body);
      return ServerModel.fromJson(result);
    } else {
      return ServerModel.fromJson(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 217, 248, 247),
          title: Text(
            "Server Status",
            style: TextStyle(color: Colors.brown),
          )),
      body: FutureBuilder<ServerModel>(
        //future: Future(() => dashboardDetails()),
        builder: (context, snapshot) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: dashboardDetails,
                child: Text(snapshot.data.toString()),
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Text(
                  isServerOn ? 'Server is ON' : 'Server is OFF',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
