import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/customtextform.dart';
import 'package:passwordmanager/customwidget/customtile.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:provider/provider.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  bool isdropdown = false;
  String selecteditem = ''; // Initialize selecteditem here
  List<String> items = ['Login', 'Card'];

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagerProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  auth.addUserInformation(
                      auth.itemtypecontroller.text,
                      auth.usernamecontroller.text,
                      auth.passwordcontroller.text,
                      auth.linkcontroller.text,
                      auth.socialmediacontroller.text,
                      context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_backspace,
              ),
            ),
            title: const Text(
              'Add Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                        controller: auth.itemtypecontroller,
                        ontap: () {
                          setState(() {
                            isdropdown = !isdropdown;
                          });
                        },
                        hint: 'type',
                        icon: const Icon(Icons.square)),
                    if (isdropdown)
                      Column(
                        children: List.generate(
                            items.length,
                            (index) => Customtile(
                                  ontap: () {
                                    setState(() {
                                      auth.itemtypecontroller.text =
                                          items[index];
                                    });
                                  },
                                  title: items[index],
                                )),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      controller: auth.socialmediacontroller,
                      hint: 'Name',
                      icon: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      controller: auth.usernamecontroller,
                      hint: 'Username',
                      icon: const Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      controller: auth.passwordcontroller,
                      hint: 'Password',
                      icon: const Icon(Icons.password_outlined),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Url',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      controller: auth.linkcontroller,
                      hint: 'https://',
                      icon: const Icon(Icons.web),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
