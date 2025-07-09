import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:launchlog/features/launch/presentation/bloc/launch_bloc.dart';
import 'package:launchlog/config/routes/route_names.dart';
import 'package:launchlog/config/routes/routes.dart';

import 'dependency_injection.dart';

final sl = GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LaunchBloc>(create: (context) =>
      //    LaunchBloc(LaunchUseCase(launchRepo: LaunchRepoImpl()))),
    sl<LaunchBloc>()),
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
          brightness: Brightness.light,
          primary: Color(0xFF1E88E5), // Blue accent
          secondary: Color(0xFFFF6F00), // Orange accent
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Color(0xFFC0C5D0)),
          titleLarge: TextStyle(color: Colors.white),
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