import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/custombutton.dart';
import 'package:passwordmanager/customwidget/customtextform.dart';
import 'package:passwordmanager/utilities/colors.dart';
import 'package:passwordmanager/utilities/icons.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController usernamecontroller = TextEditingController();
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
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Registration',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(Appicons.loginicon))),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hint: 'Username',
                  icon: Icon(Icons.person),
                  controller: usernamecontroller),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hint: 'Email',
                  icon: Icon(Icons.email),
                  controller: emailcontroller),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  widget: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility)),
                  hint: 'Password',
                  icon: Icon(Icons.lock),
                  controller: passwordcontroller),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Register',
                  backgroundcolor: Appcolors.primarypurple,
                  onpressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
