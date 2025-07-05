import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:launchlog/constants.dart';
import 'package:launchlog/model/flight.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Flight> flight = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final response = await http.get(Uri.parse(Constants.url));
      setState(() {
        flight.add(Flight.fromJson(json.decode(response.body)));
    });
  }

  Future<Uint8List?> fetchImageBytes(String url) async {
    final response = await http.get(Uri.parse(url), headers: {
      'User-Agent': 'Mozilla/5.0',
    });

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Failed to fetch image: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView.builder(
          itemCount: flight.length,
          itemBuilder: (context, i){
            return Container(
              height: 500,
              child: Column(
                children: [
                  Text(flight[i].details, style: TextStyle(
                  ),),
                  Text(flight[i].launchFailureDetails.reason),

                  //Text(flight[i].links.missionPatchSmall ),
                  Image.network(
                    flight[i].links.missionPatchSmall,
                    // Optional: Show a loading indicator while the image is fetching
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
                    // Crucial: This builder will be called if there's an error loading the image
                    fit: BoxFit.cover, // Example: how the image should fit
                  )
                ],

              ),
            );
      }),
    ));
  }
}
