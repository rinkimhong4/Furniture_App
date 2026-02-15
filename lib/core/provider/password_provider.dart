import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void toggle() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
