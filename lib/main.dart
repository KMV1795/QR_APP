import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/services/ip_address_provider.dart';
import 'package:qr_app/services/location_provider.dart';
import 'package:qr_app/services/login_time_provider.dart';
import 'package:qr_app/services/random_string_provider.dart';
import 'package:qr_app/view_screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>RandomStringProvider(),),
        ChangeNotifierProvider(create: (_)=>LoginTimeProvider(),),
        ChangeNotifierProvider(create: (_)=>LocationProvider(),),
        ChangeNotifierProvider(create: (_)=>IpAddressProvider(),),
      ],
      child: const MaterialApp(
        title: 'QR Demo App',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
