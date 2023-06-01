import 'package:flutter/material.dart';
import 'package:sandeep/main.dart';
import 'package:sandeep/pages/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => const SafeArea(
                child: Center(
                  child: Text('Route Not Exist'),
                ),
              ));
  }
}
