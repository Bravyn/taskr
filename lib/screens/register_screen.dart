import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.contains("@") && password.length >= 6 ) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => LoginScreen()),
        );
    } else {
      setState (() {
        _errorMessage = "Registration failed. Try again";
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if(_errorMessage !=  null)
                  Text(_errorMessage!, style: TextStyle(color: Colors.red)),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) => 
                    val != null && val.contains("@") ? null : "Invalid Email",
              ),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (val) =>
                    val != null && val.length > 6 ? null : "Min 6 characters",
              ),

              SizedBox(height: 16),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            _register();
                          }
                        },
                    child: Text("Register"),
                  ) ,
              TextButton(
                onPressed: () {
                  Navigator.pop(context); //go back to login
                },
                child: Text("Already have an account? Login"),
              ),
          
                        

          ],) ,),),
      );
  }
}