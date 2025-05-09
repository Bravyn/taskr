import 'package:flutter/material.dart';
import 'register_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController  = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    setState (() {
      _isLoading = true;
      _errorMessage = null;

    });

    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == "test@example.com" && password == "password") {
      Navigator.pushReplacementNamed(context, "/tasks");
    } else {
      setState(() {
        _errorMessage = "Invalid Credentials";
      });
    }

    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

      ),
      
      );
  }



}