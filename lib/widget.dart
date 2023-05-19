import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _response = '';

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://test-atre-server-v2.up.railway.app/'));
    
    if (response.statusCode == 200) {
      // If the request is successful, update the UI with the response body
      setState(() {
        _response = response.body;
      });
    } else {
      // Handle any errors that occur during the request
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 173, 236, 228),
             
                   ),
                onPressed: fetchData,
                child: Text('Fetch Data',style: TextStyle(color: Colors.brown),),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Response:',
              style: TextStyle(fontSize: 18),
              
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _response,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );

  }
}

