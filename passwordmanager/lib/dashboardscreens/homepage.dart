import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/components/storedpassword.dart';
import 'package:passwordmanager/customwidget/customtile.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:passwordmanager/view/additems.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagerProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddItems()));
            },
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Customtile(
                  trailing: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue.shade200),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  leading: const Icon(Icons.login),
                  title: 'Login',
                ),
                const SizedBox(
                  height: 15,
                ),
                Customtile(
                  trailing: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue.shade200),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  leading: const Icon(Icons.password),
                  title: 'Card',
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: auth.items.length,
                      itemBuilder: (context, index) {
                        var state = auth.items[index];
                        return Customtile(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoredProfile(
                                        username: state.username,
                                        socialmedianame: state.socialmedianame,
                                        password: state.password,
                                        link: state.link)));
                          },
                          title: state.socialmedianame,
                          subtitle: state.username,
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
