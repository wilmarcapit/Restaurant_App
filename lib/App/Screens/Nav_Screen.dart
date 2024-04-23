import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/App/Bloc/Order/order_bloc.dart';
import 'package:restaurant_app/App/Bloc/navigation_bar_bloc.dart';
import 'package:restaurant_app/App/Screens/Neworder_Screen.dart';
import 'package:restaurant_app/App/Widgets/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        if (state is NavigationBarInitial) {
          return DefaultTabController(
            length: 3,
            initialIndex: state.initialIndex,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: HexColor('113E21'),
                elevation: 0,
                title: Text(
                  'Kitchen',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                leading: Container(),
              ),
              backgroundColor: HexColor('#EFEDF4'),
              extendBodyBehindAppBar: true,
              extendBody: true,
              floatingActionButton: menu(context, state.initialIndex),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerTop,
              body: SafeArea(
                bottom: false,
                top: false,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    NewOrderScreen(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Text(
            'Something went wrong\nUnknown State',
          );
        }
      },
    );
  }

  Widget menu(BuildContext context, int currentIndex) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 80),
      decoration: BoxDecoration(
        color: HexColor('FDFDFD'),
        //border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: const Offset(
              1.0, // horizontal, move right 10
              2.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: TabBar(
          onTap: (index) => context
              .read<NavigationBarBloc>()
              .add(OnChangeTab(indexTab: index)),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              color: HexColor('B38B59'),
              borderRadius: BorderRadius.circular(5)),
          indicatorWeight: 1,
          unselectedLabelColor: HexColor('#939393'),
          indicatorColor: HexColor('939393'),
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          tabs: [
            Tab(
              child: Text(
                'New Order',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: currentIndex == 0 ? Colors.white : HexColor('404C4C'),
                ),
              ),
            ),
            Tab(
              child: Text(
                'In-Process',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: currentIndex == 1 ? Colors.white : HexColor('404C4C'),
                ),
              ),
            ),
            Tab(
              child: Text(
                'Completed',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: currentIndex == 2 ? Colors.white : HexColor('404C4C'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
