import 'package:flutter/material.dart';
import 'package:passwordmanager/dashboardscreens/analysisscreen.dart';
import 'package:passwordmanager/dashboardscreens/homepage.dart';
import 'package:passwordmanager/dashboardscreens/searchscreen.dart';
import 'package:passwordmanager/dashboardscreens/settingscreen.dart';
import 'package:passwordmanager/utilities/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currenttab = 0;
  List<Widget> screens = [
    const Homepage(),
    const AnalysisScreen(),
    const SearchScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Appcolors.primarywhite,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        currenttab = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: currenttab == 0 ? Colors.red : Colors.black,
                    )),
                Text(
                  'Home',
                  style: TextStyle(
                      color: currenttab == 0 ? Colors.red : Colors.black),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        currenttab = 1;
                      });
                    },
                    icon: Icon(
                      Icons.security_rounded,
                      color: currenttab == 1 ? Colors.red : Colors.black,
                    )),
                Text(
                  'Analysis',
                  style: TextStyle(
                      color: currenttab == 1 ? Colors.red : Colors.black),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        currenttab = 2;
                      });
                    },
                    icon: Icon(Icons.search,
                        color: currenttab == 2 ? Colors.red : Colors.black)),
                Text(
                  'Search',
                  style: TextStyle(
                      color: currenttab == 2 ? Colors.red : Colors.black),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        currenttab = 3;
                      });
                    },
                    icon: Icon(
                      Icons.settings,
                      color: currenttab == 3 ? Colors.red : Colors.black,
                    )),
                Text(
                  'Settings',
                  style: TextStyle(
                      color: currenttab == 3 ? Colors.red : Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
      body: screens[currenttab],
    );
  }
}
