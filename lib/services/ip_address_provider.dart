import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class IpAddressProvider extends ChangeNotifier{
  String _ipAddress = "";

  String get ipAddress => _ipAddress;

  void getIpAddress()async{
    String ip;
    try {
      ip = await Ipify.ipv4();
    } on PlatformException {
      ip = 'Failed to get ipAddress.';
    }
    _ipAddress = ip;
    notifyListeners();
  }

}