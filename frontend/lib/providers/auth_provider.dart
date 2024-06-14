import 'package:flutter/material.dart';
import 'package:projectlumen/services/api_service.dart';

class AuthProvider with ChangeNotifier {
  String _token;

  String get token => _token;

  Future<void> login(String email, String password) async {
    final response = await ApiService().loginUser({
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Assuming the token is in the response body
      _token = response.body;
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }
}
