import 'package:flutter/material.dart';

class LaunchDetails extends StatelessWidget {
  const LaunchDetails({super.key, required this.image, required this.id, required this.details});

  final String image;
  final String id, details;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Expanded(child: Hero(tag: id,
          child: Image.network(image))),
          Expanded(child: Column(
            children: [
              Text(details)
            ],
          ))
        ],
      ),
    ));
  }
}
