// controllers.dart
import 'package:flutter/material.dart';

class AuthController {
  bool checkCredentials(String username, String password) {
    return username.isNotEmpty && password.isNotEmpty;
  }
}
