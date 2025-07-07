import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:launchlog/constants.dart';
import 'package:launchlog/model/launches.dart';
import 'package:intl/intl.dart';
import 'package:launchlog/presentation/bloc/launch_bloc.dart';
import 'package:launchlog/presentation/bloc/launch_event.dart';
import 'package:launchlog/presentation/bloc/launch_state.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../widget/button.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: LaunchScreen(),
      item: ItemConfig(
        icon: Icon(Icons.flight_takeoff_sharp),
        title: "Launch",
      ),
    ),
    PersistentTabConfig(
      screen: Placeholder(),
      item: ItemConfig(
        icon: Icon(Icons.zoom_in_map),
        title: "X",
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
      body: PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    ));
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<LaunchBloc>().add(LaunchEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
        builder: (context, state){
          if (state is LaunchLoading ){
            return Center(child: CircularProgressIndicator());
          } else if(state is DataAvailable) {
            return ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: SizedBox(
                      height: 200,
                      child: Row(
                        children: [
                          Image.network(
                            state.launches[i].links.patch.small.toString(),
                            loadingBuilder: (BuildContext context,
                                Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                      null
                                      ? loadingProgress
                                      .cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            fit: BoxFit.cover,
                            height: 150, width: 150,
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.launches[i].name, style: TextStyle(
                                    fontWeight: FontWeight.w600
                                ),),

                                Text('windows: ${state.launches[i].window
                                    .toString()}'),
                                Text('flightNumber: ${state.launches[i]
                                    .flightNumber.toString()}'),

                                //Text(launches[i].failures[0].reason),
                                Row(
                                  children: [
                                    state.launches[i].success == true ? CustomButton(
                                      text: 'Success', color: Colors.green,) : CustomButton(
                                      color: Colors.red,
                                      text: 'Failure',),
                                    SizedBox(width: 5,),
                                    state.launches[i].fairings != null ?
                                    CustomButton(text: 'Reused', color: Colors.grey,) : Text(''),

                                  ],
                                ),
                                Text(state.launches[i].launchpad.toString()),
                                Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(
                                    state.launches[i].dateUtc)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return Text('Loading');
        });
  }
}