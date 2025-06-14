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
      //appBar: AppBar(title: Text("Login")),
      body: Stack(
        children: [
          //image
          Positioned.fill(
            child: Image.asset('assets/bgg.jpg', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Color.fromARGB(170, 0, 0, 0)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Java",
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [TextSpan(text: " House", style: TextStyle(
                      fontWeight: FontWeight.w300

                    ))],
                  ),
                ),

                
                SizedBox(height: 170),
                Text(
                  "Kenyan Gold, Roasted to Perfection",
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(height: 200),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 237, 214, 214),
                    foregroundColor: const Color.fromARGB(255, 89, 1, 1),
                    shadowColor: const Color.fromARGB(111, 249, 104, 104),
                    elevation: 8,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromARGB(255, 246, 244, 244),
                    ),
                  ),
                  child: Text("Explore Our Beans"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
