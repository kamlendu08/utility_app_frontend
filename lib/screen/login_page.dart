import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utilapp/screen/sign_up.dart';
import 'dash_board.dart';
import 'package:http/http.dart' as http;
import '../api/url.dart';
// import 'package:email_validator/email_validator.dart' as emailvalidate;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final inputemail = TextEditingController();
  TextEditingController password = TextEditingController();

  // String? get _errorText {
  //   final text = inputemail.value.text;

  //   if (text.isEmpty) {
  //     return 'Email Can\'t be empty';
  //   }
  //   if (!EmailValidator.validate(text)) {
  //     return 'Please enter a valid Email';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.purple[50],
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  Container(
                    width: 240,
                    height: 240,
                    child: Image.asset(
                      'assets/images/signupp.png',
                    ),
                  ),
                  const Text(
                    'Hello Folks!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const Text(
                    'Welcome back, you\'ve been missed!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                        child: TextFormField(
                          controller: inputemail,
                          decoration: const InputDecoration(
                            // errorText: _errorText,
                            // errorStyle: TextStyle(),
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          bottom: 5,
                        ),
                        child: TextFormField(
                          validator: (pass) {
                            if (pass == null || pass.isEmpty) {
                              return 'password cannot be empty';
                            }
                            // if (pass.length < 6) {
                            //   return 'password must be atleast 6 charecter';
                            // }
                            return null;
                          },
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Container(
                      height: 50,
                      width: size.width,
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
                          final form = formKey.currentState!;

                          if (form.validate()) {
                            final email = inputemail.text;
                            print(email);
                            Navigator.push(
                                context, SlideRightRoute(page: DashBoard()));
                          }
                          final pass = password.text;
                          print(pass);

                          // bool loggedin =
                          //     await loginuser(inputemail.text, password.text);
                          // if (loggedin) {
                          //   Navigator.push(
                          //     context,
                          //     SlideRightRoute(
                          //       page: const DashBoard(),
                          //     ),
                          //   );
                          // }
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(
                                    16.0,
                                  ),
                                ),
                                child: Text(
                                  'this is an error messege',
                                ),
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Image.asset(
                                  "assets/images/googlelogo.png",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'SIGN IN WITH GOOGLE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, SlideRightRoute(page: const SignUp()));
                        },
                        splashColor: Colors.purple[200],
                        child: const Text(
                          ' Register Now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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

Future<bool> loginuser(String email, password) async {
  var url = Uri.parse(loginurl);
  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'password': password, 'email': email}));
  print(response.body[1]);
  if (response.statusCode == 200) return true;

  return false;
}
