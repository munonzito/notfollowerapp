import 'package:flutter/material.dart';
import 'package:unfollowapp/pages/HomePage.dart';
import 'package:unfollowapp/widgets/Loading.dart';
import 'package:unfollowapp/widgets/buildTextFormField.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("NotFollowers Instagram")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    buildTextFormField(
                        label: "Username", controller: _usernameController),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormField(
                        label: "Password",
                        controller: _passwordController,
                        obscureText: true)
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home',
                          arguments: {
                            "username": _usernameController.text,
                            "pw": _passwordController.text
                          });
                    },
                    child: Text("Enter"))
              ],
            ),
          ),
        ));
  }
}
