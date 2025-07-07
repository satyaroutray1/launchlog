import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:launchlog/core/constants.dart';
import 'package:launchlog/features/data/model/rockets.dart';

import '../widget/button.dart';


class RocketScreen extends StatefulWidget {
  const RocketScreen({super.key});

  @override
  State<RocketScreen> createState() => _RocketScreenState();
}

class _RocketScreenState extends State<RocketScreen> {

  List<Rockets> rockets = [];

  @override
  void initState() {
    super.initState();
  }

  getRockets() async {
    final r = await http.get(Uri.parse(Constants.allRockets));
    rockets = (json.decode(r.body) as List).map((json) =>
        Rockets.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRockets(),
        builder: (context, state) {
      return ListView.builder(
          itemCount: rockets.length,
          itemBuilder: (context, i){
            return GestureDetector(
              onTap: (){

              },
              child: Card(
                child: SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Hero(
                        tag: rockets[i].id,
                        child: Image.network(
                          rockets[i].flickrImages[0].toString(),
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
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rockets[i].name, style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),),

                            Text('country: ${rockets[i].country
                                .toString()}'),
                            Text('flightNumber: ${rockets[i]
                                .type.toString()}'),
                            Row(
                              children: [
                                rockets[i].active ?
                                CustomButton(text: 'Active', color: Colors.green,) :
                                CustomButton(text: 'Inactive', color: Colors.grey,),
                              ],
                            ),
                            Text(rockets[i].firstFlight.toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
