import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LoginTimeProvider extends ChangeNotifier{

  String _loginDate = "";
  String _yesterdayDate = "";
  String _loginTime = "";

  String get loginDate => _loginDate;
  String get yesterdayDate => _yesterdayDate;
  String get loginTime => _loginTime;

 void getDateTime(){
   _loginDate = DateFormat('MMMM,dd,yyyy').format(DateTime.now());
   _yesterdayDate = DateFormat('MMMM,dd,yyyy').format(DateTime.now().subtract(const Duration(days: 1)));
   final time = DateFormat('hh:mm:ss a').format(DateTime.now());
   _loginTime = DateFormat.jm().format(DateFormat("hh:mm:ss a").parse(time));
   notifyListeners();
 }

}