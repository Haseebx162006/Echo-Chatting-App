import 'package:echo/services/AuthService.dart';
import 'package:flutter/material.dart';

class Authcontroller {
  final AuthService _authService = AuthService();

  Future<void> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _authService.signIn(email, password);
      final snackBar = SnackBar(content: Text("Login Successful"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> signUp(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    try {
      await _authService.signUp(name, email, password);
      final snackBar = SnackBar(content: Text("Sign Up Successful"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);   
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
