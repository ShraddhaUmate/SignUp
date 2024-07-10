import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/SignUp.dart';
import 'package:signup/dashboard.dart';


class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      SharedPreferences sp =
                      await SharedPreferences.getInstance();
                      String? storedEmail = sp.getString("email");
                      String? storedPassword = sp.getString("password");

                      if (storedEmail == emailController.text &&
                          storedPassword == passwordController.text) {
                        // Navigate to dashboard if email and password match
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      } else {
                        // Show error if email and password don't match
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid email or password"),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Sign In'),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text("Create an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
