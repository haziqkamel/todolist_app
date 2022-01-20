import 'package:flutter/material.dart';
import 'package:todolist_app/constant.dart';
import 'package:todolist_app/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = 'test';
  String password = 'testpassword';

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: usernameInputDecoration,
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: passwordInputDecoration,
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (usernameController.text != '' &&
                        passwordController.text != '') {
                      login(usernameController.text, passwordController.text);
                    } else {
                      showError(
                          context, 'Username or password cannot be empty!');
                    }
                  },
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(String usernameInput, String passwordInput) {
    FocusScope.of(context).unfocus();
    try {
      if (usernameInput != username && passwordInput != password) {
        showError(context, 'Wrong username or password');
        print('Wrong username or password');
      } else if (usernameInput != username) {
        showError(context, 'Wrong username');
        print('Wrong username');
      } else if (passwordInput != password) {
        showError(context, 'Wrong password');
        print('Wrong password');
      } else {
        usernameController.clear();
        passwordController.clear();
        Navigator.popAndPushNamed(context, 'homepage');
        print('Successful!');
      }
    } catch (error) {
      rethrow;
    }
  }
}
