import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/App/Bloc/Order/order_bloc.dart';
import 'package:restaurant_app/App/Bloc/navigation_bar_bloc.dart';

class AllActiveBLocProvider {
  static List list = [
    BlocProvider<NavigationBarBloc>(
      create: (BuildContext context) {
        return NavigationBarBloc();
      },
    ),
    BlocProvider<OrderBloc>(
      create: (BuildContext context) {
        return OrderBloc();
      },
    ),
  ];
}
