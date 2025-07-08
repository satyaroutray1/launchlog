import 'package:flutter/material.dart';
import 'package:launchlog/config/routes/route_names.dart';
import 'package:launchlog/features/launch/presentation/screens/home.dart';
import 'package:launchlog/features/launch/presentation/screens/launch_details.dart';


class Routes {

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name){
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.launchDetailScreen:
        final args = routeSettings.arguments as LaunchDetailArguments;
        return MaterialPageRoute(builder: (context)
        => LaunchDetails(image: args.image, id: args.id, details: args.details,));

      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('no routes found'),
          ),
        ));
    }
  }
}

class LaunchDetailArguments {
  final String image;
  final String id;
  final String details;

  LaunchDetailArguments({
    required this.image,
    required this.id,
    required this.details,
  });
}