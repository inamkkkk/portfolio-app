import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_app/services/data_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => DataService(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}