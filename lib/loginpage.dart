import 'dart:convert';  
import 'package:flutter/material.dart';
import 'package:forelius/first_screen.dart';
import 'package:forelius/otp_screen.dart';
import 'package:http/http.dart' as http;

String username='';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSecuredPassword = true;

Future<void> login() async {
  if (_formKey.currentState?.validate() ?? false) {
    try {
      final url = Uri.parse('https://www.forelius.com/recruitment/login.php')
          .replace(queryParameters: {
        'email': emailController.text,
        'pass': passwordController.text,
      });

      final response = await http.post(url);

      // Print the raw response body
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final bool isSuccess = responseData['status'] == 'success'; 

        // Print the parsed response data
        print('Response data: $responseData');

        if (isSuccess) {
          if (responseData.containsKey('data') && responseData['data'].isNotEmpty) {
            final username = responseData['data'][0]['username'];
            print('Username from response: $username');

            // Navigate to the next screen, passing the username
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FirstScreen(username: username),
              ),
            );
          } else {
            print('Username field not found in response.');
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed: ${responseData['message'] ?? 'Unknown error'}"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login failed. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('An error occurred: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}



  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 21, 77),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 26),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 250),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter an Email',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _isSecuredPassword,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: togglePassword(),
                  labelText: 'Enter a Password',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 3) {
                    return 'Password must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 60),
              Center(
                child: Container(
                  height: 60,
                  width: width - 190,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 176, 10, 101),
                        const Color.fromARGB(255, 191, 40, 10)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Or",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 60,
                  width: width - 190,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 176, 10, 101),
                        const Color.fromARGB(255, 191, 40, 10)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Sign in with OTP",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecuredPassword = !_isSecuredPassword;
        });
      },
      icon: _isSecuredPassword
          ? Icon(Icons.visibility_off)
          : Icon(Icons.visibility),
      color: const Color.fromARGB(255, 199, 21, 77),
    );
  }
}
