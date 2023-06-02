// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:sandeep/pages/settings_screen.dart';
import 'package:sandeep/pages/welcome.dart';

import 'accounts_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 0;
  // const HomeScreen({super.key});
  void changeRoute(int val) {
    print(val);
    print(pageList[val]);
    setState(() {
      currentPage = val;
    });
  }

  List<Widget> pageList = [
    const HomeLayoutWidget(),
    // const SettingsLayoutWidget(),
    const ProfileLayoutWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: const Color.fromRGBO(143, 148, 251, 1),
        unselectedItemColor: const Color.fromRGBO(143, 148, 251, 0.5),
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          // BottomNavigationBarItem(
          //     label: 'Settings', icon: Icon(Icons.settings)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.verified_user)),
        ],
        onTap: changeRoute,
      ),
    );
  }
}
