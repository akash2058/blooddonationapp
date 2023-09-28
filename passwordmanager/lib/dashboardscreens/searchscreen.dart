import 'package:flutter/material.dart';
import 'package:passwordmanager/customwidget/customtextform.dart';
import 'package:passwordmanager/customwidget/customtile.dart';
import 'package:passwordmanager/models/itemsmodel.dart';
import 'package:passwordmanager/provider/providerlist.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ItemModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagerProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CustomTextFormField(
                  onchanged: (query) {
                    setState(() {
                      searchResult = auth.items
                          .where((item) => item.socialmedianame
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                    });
                  },
                  hint: 'Search',
                  icon: const Icon(Icons.search),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchResult.length,
                    itemBuilder: (context, index) {
                      return Customtile(
                        title: searchResult[index].socialmedianame,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
