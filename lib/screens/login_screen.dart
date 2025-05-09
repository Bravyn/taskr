import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    setState(() {
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_errorMessage != null)
                Text(_errorMessage!, style: TextStyle(color: Colors.red)),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator:
                    (val) =>
                        val != null && val.contains("@")
                            ? null
                            : "Invalid Email",
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator:
                    (val) =>
                        val != null && val.length >= 6
                            ? null
                            : "Min 6 characters",
              ),
              SizedBox(height: 16),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: Text('Login'),
                  ),
              TextButton(
                onPressed: () {
                  print(1);/*
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen())
                  );*/
                }, child: Text("Don't have an account? Register"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
