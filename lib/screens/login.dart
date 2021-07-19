import 'package:flutter/material.dart';
import 'package:untitled/controllers/authController.dart';
class Login extends StatelessWidget {

AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login page"),
      ),
      body : Column(
        children: [
          TextField(
            controller:authController.email,
          ),
          TextField(
            controller:authController.password,
          ),
          TextButton(
            child : Text("log in"),
            onPressed: (){
              authController.signUp();
            },
          ),
        ],
      ),
    );
  }
}
