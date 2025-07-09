import 'package:flutter/material.dart';

class LaunchDetails extends StatelessWidget {
  const LaunchDetails({super.key, required this.image, required this.id, required this.details});

  final String image;
  final String id, details;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xff0B0F1A),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Hero(tag: id,
          child: Image.network(image))),
          Expanded(
              child: Column(
            children: [
              Text(details, textAlign: TextAlign.start,),

            ],
          ))
        ],
      ),
    ));
  }
}
