import 'package:flutter/material.dart';
import 'package:project/config/mySqlConnector.dart';
import 'package:project/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  dbConnector();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary',
      home: LoginListPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
    );
  }
}
