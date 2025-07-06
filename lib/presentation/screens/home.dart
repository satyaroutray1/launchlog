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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //List<Launches> launches = [];

  @override
  void initState() {
    super.initState();
    //getData();
    context.read<LaunchBloc>().add(LaunchEvent());
  }
  //
  // getData() async {
  //   final response = await http.get(Uri.parse(Constants.allLaunchesUrl));
  //
  //   launches = (json.decode(response.body) as List).map((json) => Launches.fromJson(json)).toList();
  //   setState(() {
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<LaunchBloc, LaunchState>(
          builder: (context, state){
          return ListView.builder(
            itemCount: state.launches.length,
            itemBuilder: (context, i){
              return Card(
                child: SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Image.network(
                        state.launches[i].links.patch.small.toString(),
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        fit: BoxFit.cover,
                        height: 150, width: 150,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.launches[i].name, style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),),

                            Text('windows: ${state.launches[i].window.toString()}'),
                            Text('flightNumber: ${state.launches[i].flightNumber.toString()}'),

                            //Text(launches[i].failures[0].reason),
                            Text(state.launches[i].launchpad.toString()),
                            state.launches[i].fairings !=null ? state.launches[i].fairings!.reused == true ? Text('Reused') : Text('') : Text(''),
                            state.launches[i].success == true ? Text('Success') : Container(
                                color: Colors.red, child: Text('Failure', style: TextStyle(color: Colors.white),)),
                            Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(state.launches[i].dateUtc)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });

      }),
    ));
  }
}
