import 'package:flutter/material.dart';

class PinProvider with ChangeNotifier {
  String? _pin;

  String? get pin => _pin;

  set pin(String? value) {
    _pin = value;
    notifyListeners();
  }
  bool checkPin(String inputPin) {
    return _pin == inputPin;
  }

  void clearPin() {
    _pin = null;
    notifyListeners();
  }
}
