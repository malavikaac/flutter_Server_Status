import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ServerStatusScreen extends StatefulWidget {
  @override
  _ServerStatusScreenState createState() => _ServerStatusScreenState();
}

class _ServerStatusScreenState extends State<ServerStatusScreen> {
  bool serverStatus = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(minutes: 2), (Timer t) {
      checkServerStatus();
    });
  }

  Future<void> checkServerStatus() async {
    try {
      final response = await http
          .get(Uri.parse('http://your-server-url.com'));
      if (response.statusCode == 200) {
        print(response.body);
        print('Request successful');
        setState(() {
          serverStatus = true;
          var data = response.body;
        });
      } else {
        setState(() {
          serverStatus = false;
          print('Request failed with status: ${response.statusCode}');
        });
      }
    } catch (e) {
      setState(() {
        serverStatus = false;
        print('Error: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 173, 236, 228),
        title: Text(
          'Server Status',
          style: TextStyle(color: Colors.brown),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    serverStatus ? 'Server Status :' : 'Server Status :',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    serverStatus ? Icons.check_circle : Icons.error,
                    color: serverStatus ? Colors.green : Colors.red,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 224, 224, 224),
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
