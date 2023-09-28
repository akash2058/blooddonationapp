import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/customtile.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:passwordmanager/view/loginview.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ManagerProvider>(
        builder: (context, auth, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Customtile(
                  title: 'Autofill',
                  trailing: CupertinoSwitch(
                    value: auth.switchautofill,
                    onChanged: (value) {
                      auth.switchon();
                    },
                  ),
                ),
                Customtile(
                  title: 'Themes',
                  trailing: CupertinoSwitch(
                    value: auth.changetheme,
                    onChanged: (value) {
                      auth.toggleTheme();
                    },
                  ),
                ),
                Customtile(
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  title: 'Logout',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
