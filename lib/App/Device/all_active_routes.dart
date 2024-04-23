import 'package:flutter/material.dart';
import 'package:restaurant_app/App/Screens/Nav_Screen.dart';

class ActiveRoutes {
  static Map<String, Widget Function(BuildContext)> list = {
    NavScreen.routeName: (context) => const NavScreen(),
  };
}
