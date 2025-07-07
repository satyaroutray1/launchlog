import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:launchlog/core/constants.dart';
import 'package:intl/intl.dart';
import 'package:launchlog/features/presentation/screens/rocket_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../widget/button.dart';
import 'launch_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: Container(
          //color:Colors.black,
          child: LaunchScreen()),
      item: ItemConfig(
        icon: Icon(Icons.flight_takeoff_sharp),
        title: "Launch",
      ),
    ),
    PersistentTabConfig(
      screen: RocketScreen(),
      item: ItemConfig(
        icon: Icon(Icons.rocket_launch_outlined),
        title: "Rockets",
      ),
    ),
    PersistentTabConfig(
      screen: Placeholder(),
      item: ItemConfig(
        icon: Icon(Icons.zoom_in_map),
        title: "X",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Launch Log'),
        elevation: 10,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person_4)),

        ],
      ),
      body: PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    ));
  }
}
