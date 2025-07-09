import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:launchlog/core/constants.dart';
import 'package:intl/intl.dart';
import 'package:launchlog/features/launch/presentation/screens/rocket_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../widget/button.dart';
import 'launch_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: LaunchScreen(),
      item: ItemConfig(
        icon: Icon(Icons.flight_takeoff_sharp),
        title: "Launch",
        inactiveForegroundColor: Color(0xff7A7F90),
        activeForegroundColor: Color(0xff00BFFF),
  ),
    ),
    PersistentTabConfig(
      screen: RocketScreen(),
      item: ItemConfig(
        icon: Icon(Icons.rocket_launch_outlined),
        title: "Rockets",
        inactiveForegroundColor: Color(0xff7A7F90),
        activeForegroundColor: Color(0xff00BFFF),
      ),
    ),
    PersistentTabConfig(
      screen: Container(
          color:Color(0xff0B0F1A),
          child: Placeholder()),
      item: ItemConfig(
        icon: Icon(Icons.zoom_in_map),
        title: "X",
        inactiveForegroundColor: Color(0xff7A7F90),
        activeForegroundColor: Color(0xff00BFFF),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0B0F1A),
        title: Text('Launch Log', style: TextStyle(color: Colors.white),),
        elevation: 10,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person_4, color: Colors.white,)),

        ],
      ),
      body: PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Color(0xff12151F)
          ),
        ),
      ),
    ));
  }
}
