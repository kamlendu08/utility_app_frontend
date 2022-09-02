import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const routname = '\signuppage';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameInput = TextEditingController();
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _repasswordInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                textinput(
                  inputController: _usernameInput,
                  text: 'Username',
                ),
                const SizedBox(
                  height: 10,
                ),
                textinput(
                  inputController: _emailInput,
                  text: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                textinput(
                  inputController: _passwordInput,
                  text: 'Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                textinput(
                  inputController: _repasswordInput,
                  text: 're-enter Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
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
            color: Colors.purple,
          ),
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            controller: inputController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: text),
          ),
        ),
      ),
    );
  }
}
