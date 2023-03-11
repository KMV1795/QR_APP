import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }


  // Login with phone number
  Future<void> loginWithPhoneNumber(BuildContext context) async {
    if (_phoneNumber.isEmpty) {
     // Fluttertoast.showToast(msg: 'Please enter a phone number');
      return;
    }
    AuthService authService = context.read<AuthService>();
    await authService.signInWithPhoneNumber(_phoneNumber);
  }
}
