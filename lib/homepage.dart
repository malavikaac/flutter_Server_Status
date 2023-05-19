// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ServerStatusWidget extends StatefulWidget {
//   @override
//   _ServerStatusWidgetState createState() => _ServerStatusWidgetState();
// }

// class _ServerStatusWidgetState extends State<ServerStatusWidget> {
//   bool isServerOn = false;

//   Future<void> checkServerStatus() async {
//     try {
//       final response = await http.get(Uri.parse('http://your-server-url.com'));
//       if (response.statusCode == 200) {
//         setState(() {
//           isServerOn = true;
//         });
//       } else {
//         setState(() {
//           isServerOn = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isServerOn = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 217, 248, 247),
//           title: Text(
//             "Server Status",
//             style: TextStyle(color: Colors.brown),
//           )),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: checkServerStatus,
//               child: Text('Check Server Status'),
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             isServerOn ? 'Server is ON' : 'Server is OFF',
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ],
//       ),
//     );
//   }
// }
