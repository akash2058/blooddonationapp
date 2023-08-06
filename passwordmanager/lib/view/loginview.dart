import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/custombutton.dart';
import 'package:passwordmanager/customwidget/customtextform.dart';
import 'package:passwordmanager/utilities/colors.dart';
import 'package:passwordmanager/utilities/icons.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Appicons.loginbackground))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(Appicons.loginicon))),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hint: 'Email',
                  icon: Icon(Icons.person),
                  controller: emailcontroller),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                  hint: 'Password',
                  icon: Icon(Icons.lock),
                  widget: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility)),
                  controller: passwordcontroller),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  text: 'Login',
                  backgroundcolor: Appcolors.primarypurple,
                  onpressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
