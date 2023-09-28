import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/dashboard.dart';
import 'package:passwordmanager/models/itemsmodel.dart';
import 'package:passwordmanager/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerProvider extends ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController itempasswordcontroller = TextEditingController();
  TextEditingController itemtypecontroller = TextEditingController();
  TextEditingController socialmediacontroller = TextEditingController();
  TextEditingController linkcontroller = TextEditingController();

  final registerformkey = GlobalKey<FormState>();
  final loginformkey = GlobalKey<FormState>();

  bool hideregisterpassword = true;
  bool hidestoredpassword = true;
  bool hidepassword = true;
  bool loading = false;
  bool loadingregister = false;
  bool switchautofill = false;
  bool changetheme = false;
  int current = 0;
  switchon() {
    switchautofill = !switchautofill;
    notifyListeners();
  }

  hidePassword() {
    hidepassword = !hidepassword;
    notifyListeners();
  }

  hideregister() {
    hideregisterpassword = !hideregisterpassword;
    notifyListeners();
  }

  hidestoreddpassword() {
    hidestoredpassword = !hidestoredpassword;
    notifyListeners();
  }

  Usermodel? _user;
  Usermodel? get user => _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(context) async {
    loading = true;
    notifyListeners();

    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      print(authResult);
      // Check if sign-in is successful
      if (authResult.user != null) {
        // Update the _user field with the signed-in user's data
        _user = Usermodel(
          uid: authResult.user!.uid,
          name: authResult.user!.displayName ??
              "", // Use an empty string if displayName is null
          email: authResult.user!.email ?? "",
          // Use an empty string if email is null
        );
      }
      if (_user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Succesffully!!!')));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('invalid Credentials')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }

    loading = false;
    notifyListeners();
  }

  Future<void> registerWithUsernamePhoneAndPassword(String username,
      String email, String password, String phoneNumber, context) async {
    loadingregister = true;
    notifyListeners();
    try {
      // Check if the email is not empty
      if (email.isEmpty) {
        throw FirebaseAuthException(
          code: 'missing-email',
          message: 'Email is required for registration.',
        );
      }

      // Create the user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      // Update the user's display name with the username
      // ignore: deprecated_member_use
      await userCredential.user?.updateProfile(displayName: username);
      await userCredential.user?.reload();

      // Update the phone number (This is a placeholder as Firebase does not provide direct phone number access)
      // Capture user credentials and notify listeners
      _user = Usermodel(
        uid: userCredential.user?.uid ?? '',
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        // Retrieve the updated phone number
      );
      if (_user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Register Succesfully !!!')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('$e')));
      }

      loadingregister = false;
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      print("Registration failed: $e");
      throw e;
    }
  }

  ThemeData get currentTheme => changetheme ? darkTheme : lightTheme;

  void toggleTheme() {
    changetheme = !changetheme;
    notifyListeners();
  }

  //  final List<RequestBloodModel> _listofrequestblooad = [];
  // List<RequestBloodModel> get requestlist => _listofrequestblooad;
  final List<ItemModel> _listitems = [];
  List<ItemModel> get items => _listitems;
  bool loadingdonarslist = false;
  bool loadingrequestlist = false;

  late ItemModel _item;
  ItemModel? get item => _item;
  // late RequestBloodModel _request;
  // RequestBloodModel? get request => _request;

  Future<void> addUserInformation(
    String type,
    String username,
    String password,
    String link,
    String socialmedianame,
    context,
  ) async {
    loadingdonarslist = true;
    notifyListeners();
    try {
      ItemModel itemModel = ItemModel(
          type: type,
          socialmedianame: socialmedianame,
          username: username,
          password: password,
          link: link);

      // Convert the DonarModel object to a Map
      Map<String, dynamic> itemModels = itemModel.tojson();

      var donorRef =
          await FirebaseFirestore.instance.collection('users').add(itemModels);

      // Save user information to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Type', type);
      prefs.setString('SocialMedia', socialmedianame);
      prefs.setString('Username', username);
      prefs.setString('Password', password);
      prefs.setString('Link', link);

      _item = ItemModel(
          type: type,
          socialmedianame: socialmedianame,
          username: username,
          password: password,
          link: link);

      if (_item != null) {
        addDonar(_item);

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Password Store')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Donor creation failed')));
      }

      print('password ${donorRef.id}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      print('Error adding user: $e');
    }
  }

  void addDonar(ItemModel item) {
    _listitems.add(item);
    current;
    notifyListeners();
  }

  void removeDonar(ItemModel item) {
    _listitems.remove(item);
    notifyListeners();
  }

  String generatePassword({
    int length = 12,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeDigits = true,
    bool includeSpecialChars = true,
  }) {
    const uppercaseChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const lowercaseChars = "abcdefghijklmnopqrstuvwxyz";
    const digitChars = "0123456789";
    const specialChars = "!@#\$%^&*()_-+=<>?";

    final List<String> charCategories = [];

    if (includeUppercase) charCategories.add(uppercaseChars);
    if (includeLowercase) charCategories.add(lowercaseChars);
    if (includeDigits) charCategories.add(digitChars);
    if (includeSpecialChars) charCategories.add(specialChars);

    if (charCategories.isEmpty) {
      throw ArgumentError("At least one character category must be selected.");
    }

    final Random random = Random.secure();
    final int numCategories = charCategories.length;
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < length; i++) {
      final categoryIndex = random.nextInt(numCategories);
      final categoryChars = charCategories[categoryIndex];
      final charIndex = random.nextInt(categoryChars.length);
      buffer.write(categoryChars[charIndex]);
    }

    return buffer.toString();
  }
}

final lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  // Define light theme colors, text styles, etc.
);

final darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  // Define dark theme colors, text styles, etc.
);
