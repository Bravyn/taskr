import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //final final _repeatPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;
    // = _repeatPasswordController.text;

    if (email.contains("@") && password.length >= 6) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sign Up Successfully")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    } else {
      setState(() {
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
              if (_errorMessage != null)
                Text(_errorMessage!, style: TextStyle(color: Colors.red)),
              SizedBox(height: 150),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "example@domain.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "An email address is required";
                  } else if (!EmailValidator.validate(val)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              SizedBox(height: 22),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Minimum 8 characters",
                  hintStyle: TextStyle(color: Colors.blueAccent),
                  prefixIcon: Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                    onPressed:
                        () => {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Viewing Password")),
                          ),
                        },
                    icon: Icon(Icons.remove_red_eye),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                obscureText: true,
                validator:
                    (val) =>
                        val != null && val.length > 8
                            ? null
                            : "Min 8 characters",
              ),
              SizedBox(height: 6),
              Text("Password should include numbers, characters and symbols"),

              SizedBox(height: 18),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _register();
                      }
                    },
                    child: Text("Register Now"),
                  ),
              SizedBox(height: 8),
              Text("or", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 4),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {
                  Navigator.pop(context); //go back to login
                },
                child: Text("Click here if you already have an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
