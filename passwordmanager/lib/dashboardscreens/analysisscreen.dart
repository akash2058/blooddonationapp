import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordmanager/customwidget/customtile.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:provider/provider.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  @override
  String generatedPassword = '';

  generatePassword(context) {
    var state = Provider.of<ManagerProvider>(context, listen: false);
    setState(() {
      generatedPassword = state.generatePassword();
    });
  }

  void copyPasswordToClipboard() {
    Clipboard.setData(ClipboardData(
        text: generatedPassword)); // Copy the password to the clipboard
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<ManagerProvider>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 58),
                const Text(
                  'Generated Password:',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      generatedPassword,
                      style: const TextStyle(fontSize: 25),
                    ),
                    IconButton(
                        onPressed: copyPasswordToClipboard,
                        icon: const Icon(Icons.copy_all))
                  ],
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () {
                    generatePassword(context);
                  },
                  child: const Text('Generate Password'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
