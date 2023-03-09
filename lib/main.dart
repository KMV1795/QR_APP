import 'package:flutter/material.dart';
import 'package:qr_app/view_screens/login_details_page.dart';
import 'package:qr_app/view_screens/login_page.dart';
import 'package:qr_app/view_screens/qr_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginDetails(),
    );
  }
}
