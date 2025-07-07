import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:launchlog/presentation/bloc/launch_bloc.dart';
import 'package:launchlog/presentation/screens/home.dart';
import 'package:launchlog/routes/route_names.dart';
import 'package:launchlog/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LaunchBloc>(create: (context) => LaunchBloc()),
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
          brightness: Brightness.light,
          primary: Color(0xFF1E88E5), // Blue accent
          secondary: Color(0xFFFF6F00), // Orange accent
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),

        ),
        useMaterial3: true,
      ),
      //home: HomeScreen(),
         initialRoute: RouteNames.homeScreen,
      onGenerateRoute: Routes.generateRoutes,
      debugShowCheckedModeBanner: false,
    ));
  }
}