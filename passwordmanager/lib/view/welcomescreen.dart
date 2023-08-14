import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/custombutton.dart';
import 'package:passwordmanager/utilities/colors.dart';
import 'package:passwordmanager/utilities/icons.dart';
import 'package:passwordmanager/view/loginview.dart';
import 'package:passwordmanager/view/registration.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
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
              CustomButton(
                  text: 'Register',
                  backgroundcolor: Appcolors.primarypurple,
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterView()));
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Login',
                  backgroundcolor: const Color.fromARGB(255, 221, 143, 235),
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
