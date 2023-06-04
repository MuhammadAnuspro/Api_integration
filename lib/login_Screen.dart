import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task/Home.dart';
import 'package:task/Model/user_Model.dart';
import 'package:http/http.dart' as http;
import 'package:task/primaryButton.dart';
import 'package:task/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _onSubmit() async {
    _formKey.currentState!.save();
  }

  TextEditingController userNameC = TextEditingController();
  TextEditingController passC = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': 'Sincere@april.biz', 'password': '12345'});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Task',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 90),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: 7,
                        color: Colors.grey.withOpacity(0.15),
                      ),
                    ]),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      controller: userNameC,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.red,
                        ),
                        hintText: 'Email',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: 7,
                        color: Colors.grey.withOpacity(0.15),
                      ),
                    ]),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        }
                        return null;
                      },
                      controller: passC,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.red,
                        ),
                        hintText: 'Password',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 5,
                        )
                      ]),
                      height: 60,
                      width: double.infinity,
                      child: PrimaryButton(
                          title: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _onSubmit();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => HomeScreen())));
                            }
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
