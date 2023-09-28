import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/custombutton.dart';
import 'package:passwordmanager/customwidget/customtextform.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManagerProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: auth.registerformkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Registration',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validation: (value) {
                        if (!isUsernameValid(value!)) {
                          return 'Invalid username';
                        }
                        return null;
                      },
                      hint: 'Username',
                      icon: const Icon(Icons.person),
                      controller: auth.usernamecontroller),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validation: (value) {
                        if (!isEmailValid(value!)) {
                          return 'Invalid email ';
                        }
                        return null;
                      },
                      hint: 'Email',
                      icon: const Icon(Icons.email),
                      controller: auth.emailcontroller),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validation: (value) {
                        if (!isPasswordValid(value!)) {
                          return 'Invalid password';
                        }
                        return null;
                      },
                      obstruct: auth.hideregisterpassword,
                      widget: IconButton(
                          onPressed: () {
                            auth.hideregister();
                          },
                          icon: Icon(auth.hideregisterpassword
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      hint: 'Password',
                      icon: const Icon(Icons.lock),
                      controller: auth.passwordcontroller),
                  const SizedBox(
                    height: 20,
                  ),
                  auth.loadingregister == true
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Register',
                          backgroundcolor: Colors.blue,
                          onpressed: () {
                            if (auth.registerformkey.currentState!.validate()) {
                              auth.registerWithUsernamePhoneAndPassword(
                                  auth.usernamecontroller.text,
                                  auth.emailcontroller.text,
                                  auth.passwordcontroller.text,
                                  auth.passwordcontroller.text,
                                  context);
                            }
                          })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

bool isUsernameValid(String username) {
  // Define a regular expression pattern for a valid username
  final usernamePattern = RegExp('[A-Z]');
  return usernamePattern.hasMatch(username);
}

bool isEmailValid(String email) {
  // Define a regular expression pattern for a valid email
  final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailPattern.hasMatch(email);
}

bool isPasswordValid(String password) {
  // Define a regular expression pattern for a valid password (at least 6 characters)
  return password.length >= 8;
}
