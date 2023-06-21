import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_service.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiService>(create: ((context) => ApiService()))
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.cyan),
        title: 'Flutter Demo',
        home: ServerStatusWidget(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
