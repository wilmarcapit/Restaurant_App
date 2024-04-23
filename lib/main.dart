import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/App/Device/all_active_bloc.dart';
import 'package:restaurant_app/App/Device/all_active_routes.dart';
import 'package:restaurant_app/App/Screens/Login_Screen.dart';
import 'package:restaurant_app/App/Screens/Neworder_Screen.dart';
import 'package:restaurant_app/App/Widgets/dismiss_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MultiBlocProvider(
        providers: [
          ...AllActiveBLocProvider.list,
        ],
        child: MaterialApp(
          title: 'Kitchen App',
          theme: ThemeData(
            primaryColor: Colors.teal,
            useMaterial3: true,
          ),
          home: LoginScreen(),
          routes: ActiveRoutes.list,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
