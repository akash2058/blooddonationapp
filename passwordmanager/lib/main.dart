import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/dashboard.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:passwordmanager/view/loginview.dart';
import 'package:passwordmanager/view/welcomescreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyAjkzawRmGIZhGUcHzsfArEQKzPhYLrquI',
            appId: '1:1091965833614:android:f14a4b20c94c8e803b94df',
            messagingSenderId: 'messagingkey',
            projectId: "passwordmanager-231a5"));
  } catch (e) {}
  runApp(ChangeNotifierProvider<ManagerProvider>(
    lazy: false,
    create: (context) => ManagerProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ManagerProvider>(context);
    return MaterialApp(
        theme: data.currentTheme,
        debugShowCheckedModeBanner: false,
        home: Welcome());
  }
}
