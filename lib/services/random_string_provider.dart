import 'dart:math';
import 'package:flutter/cupertino.dart';

class RandomStringProvider extends ChangeNotifier {

  String _randomString = '';

  String get randomString => _randomString;

  void generateRandomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    _randomString = String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
    notifyListeners();
  }
}