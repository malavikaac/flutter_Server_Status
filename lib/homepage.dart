import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'api_service.dart';
import 'model.dart';

class ServerStatusWidget extends StatefulWidget {
  @override
  _ServerStatusWidgetState createState() => _ServerStatusWidgetState();
}

class _ServerStatusWidgetState extends State<ServerStatusWidget> {
  bool isServerOn = true;
  String? status;
  String? message;

  @override
  void initState() {
    final _serverApi = Provider.of<ApiService>(context, listen: false);
    _serverApi.getServer().then((value) {
      status = value!.status;
      message = value.message;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _serverApi = Provider.of<ApiService>(context);
    print(message);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 217, 248, 247),
          title: Text(
            "Server Status",
            style: TextStyle(color: Colors.brown),
          )),
      body: FutureBuilder<ServerConnectionModel>(
        //future: Future(() => dashboardDetails()),
        builder: (context, snapshot) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    _serverApi.getServer();
                  },
                  child: const Text("check")
                  // Text(snapshot.data.toString()),
                  ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isServerOn ? 'Server is ON' : 'Server is OFF',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.cyan),
            )
          ],
        ),
      ),
    );
  }
}
