import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:launchlog/constants.dart';
import 'package:launchlog/model/launches.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Launches> launches = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final response = await http.get(Uri.parse(Constants.allLaunchesUrl));
      setState(() {
        launches.add(Launches.fromJson(json.decode(response.body)));
      });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView.builder(
          itemCount: launches.length,
          itemBuilder: (context, i){
            return Container(
              height: 500,
              child: Column(

                children: [
                  Text(launches[i].name, style: TextStyle(
                  ),),
                  Text(launches[i].details.toString()),

                  Image.network(
                    launches[i].links.patch.small.toString(),
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
                    fit: BoxFit.cover, // Example: how the image should fit
                  )
                ],
              ),
            );
      }),
    ));
  }
}
