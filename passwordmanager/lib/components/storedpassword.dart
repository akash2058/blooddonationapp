// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordmanager/customwidget/customtile.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StoredProfile extends StatefulWidget {
  String username;
  String socialmedianame;
  String password;
  String link;
  StoredProfile({
    Key? key,
    required this.username,
    required this.socialmedianame,
    required this.password,
    required this.link,
  }) : super(key: key);

  @override
  State<StoredProfile> createState() => _StoredProfileState();
}

class _StoredProfileState extends State<StoredProfile> {
  void copyPasswordToClipboard() {
    Clipboard.setData(ClipboardData(
        text: widget.password)); // Copy the password to the clipboard
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagerProvider>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_backspace)),
          ),
          body: Column(
            children: [
              Customtile(
                title: 'Username',
                subtitle: widget.username,
              ),
              SizedBox(
                height: 15,
              ),
              Customtile(
                title: 'Name',
                subtitle: widget.socialmedianame,
              ),
              SizedBox(
                height: 15,
              ),
              Customtile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.copy_all)),
                    IconButton(
                        onPressed: () {
                          state.hidestoreddpassword();
                        },
                        icon: Icon(state.hidestoredpassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ],
                ),
                title: 'Password',
                subtitle:
                    state.hidestoredpassword ? widget.password : '*********',
              ),
              SizedBox(
                height: 15,
              ),
              Customtile(
                title: 'Link',
                subtitle: widget.link,
              ),
            ],
          ),
        );
      },
    );
  }
}
