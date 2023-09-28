import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/custombutton.dart';
import 'package:passwordmanager/customwidget/customtextform.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:passwordmanager/view/registration.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManagerProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: auth.loginformkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 50,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AutofillGroup(
                    child: CustomTextFormField(
                        keyboard: TextInputType.emailAddress,
                        autofills: const [AutofillHints.email],
                        validation: (value) {
                          if (!isEmailValid(value!)) {
                            return 'Invalid email ';
                          }
                          return null;
                        },
                        hint: 'Email',
                        icon: const Icon(Icons.person),
                        controller: auth.emailcontroller),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AutofillGroup(
                    child: CustomTextFormField(
                        keyboard: TextInputType.visiblePassword,
                        autofills: const [AutofillHints.email],
                        validation: (value) {
                          if (!isPasswordValid(value!)) {
                            return 'Invalid password';
                          }
                          return null;
                        },
                        obstruct: auth.hidepassword,
                        hint: 'Password',
                        icon: const Icon(Icons.lock),
                        widget: IconButton(
                            onPressed: () {
                              auth.hidePassword();
                            },
                            icon: Icon(auth.hidepassword
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        controller: auth.passwordcontroller),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  auth.loading == true
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Login',
                          onpressed: () {
                            if (auth.loginformkey.currentState!.validate()) {
                              auth.signIn(context);
                            }
                          },
                          backgroundcolor: Colors.blue,
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If You don't have an account ?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

bool isEmailValid(String email) {
  // Define a regular expression pattern for a valid email
  final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailPattern.hasMatch(email);
}

bool isPasswordValid(String password) {
  // Define a regular expression pattern for a valid password (at least 6 characters)
  return password.length >= 6;
}
