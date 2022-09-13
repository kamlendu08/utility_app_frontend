import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:utilapp/api/url.dart';
import 'package:utilapp/screen/dash_board.dart';
import 'otpscreen.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  static const routname = '\signuppage';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final _usernameInput = TextEditingController();
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _repasswordInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[50],
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple.shade100),
                      child: Image.asset(
                        'assets/images/login.png',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // textinput(
                  //   inputController: _usernameInput,
                  //   text: 'Username',
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 5,
                        ),
                        child: TextFormField(
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Username cannot be empty';
                            }
                            return null;
                          },
                          controller: _usernameInput,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  // textinput(
                  //   inputController: _emailInput,
                  //   text: 'Email',
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 5,
                        ),
                        child: TextFormField(
                          validator: (email) {
                            if (email == null) {
                              return 'Email cannot be empty';
                            }
                            if (!EmailValidator.validate(email)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          controller: _emailInput,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),
                  // textinput(
                  //   inputController: _passwordInput,
                  //   text: 'Password',
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 5,
                        ),
                        child: TextFormField(
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'password cannot be empty';
                            }
                            if (password.length < 6) {
                              return 'password must be atleast 6 charecter';
                            }
                            return null;
                          },
                          controller: _passwordInput,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  // textinput(
                  //   inputController: _repasswordInput,
                  //   text: 'Re-enter Password',
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 5,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          validator: (repassword) {
                            if (repassword == null || repassword.isEmpty) {
                              return 'password cannot be empty';
                            }
                            if (repassword != _passwordInput.text) {
                              return 'Passwords do NOT match';
                            }
                            return null;
                          },
                          controller: _repasswordInput,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Re-enter Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.white54,
                          ),
                        ),
                        onPressed: () async {
                          bool otpsent = true;
                          final form = formKey.currentState!;
                          if (form.validate()) {
                            Navigator.push(
                                context,
                                SlideRightRoute(
                                    page: Otp(
                                  Email: _emailInput.text,
                                  Password: _passwordInput.text,
                                  Username: _usernameInput.text,
                                )));
                          }

                          //await otpRequest(
                          //  _usernameInput.text, _emailInput.text);

                          // if (otpsent) {
                          //   Navigator.push(
                          //       context,
                          //       SlideRightRoute(
                          //           page: Otp(
                          //         Username: _usernameInput.text,
                          //         Password: _passwordInput.text,
                          //         Email: _emailInput.text,
                          //       )));
                          // }
                        },
                        child: const Center(
                          child: Text(
                            'SEND OTP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 5,
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Image.asset(
                                  "assets/images/googlelogo.png",
                                ),
                              ),
                              const Text(
                                'SIGN UP WITH GOOGLE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class textinput extends StatelessWidget {
  final TextEditingController inputController;
  final String text;

  const textinput({
    Key? key,
    required this.inputController,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple,
          ),
          color: Colors.deepPurple[50],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            controller: inputController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: text),
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          ),
        );
}

Future<bool> otpRequest(String username, String email) async {
  var url = Uri.parse(sendOtp);

  // var body = {'username': username, 'email': email};
  // print(jsonEncode(body));
  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': username, 'email': email}));
  if (response.statusCode == 200) return true;

  return false;
}
