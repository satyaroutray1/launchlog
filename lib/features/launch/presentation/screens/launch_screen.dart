import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:launchlog/config/routes/route_names.dart';
import 'package:launchlog/config/routes/routes.dart';
import 'package:launchlog/features/launch/presentation/screens/launch_details.dart';

import '../bloc/launch_bloc.dart';
import '../bloc/launch_event.dart';
import '../bloc/launch_state.dart';
import '../widget/button.dart';

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
                  final launch = state.launches[i];
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.launchDetailScreen,
                          arguments: LaunchDetailArguments(
                            image: launch.imageUrl.toString(),// .links.patch.small.toString(),
                                id: launch.id, details: launch.details.toString()
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      padding: EdgeInsets.all(5),
                      child: Card(
                        color: Color(0xff1C1F2A),
                        child: SizedBox(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Hero(
                                  tag: launch.id,
                                  child: Image.network(
                                    launch.imageUrl.toString(),// links.patch.small.toString(),
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
                                    fit: BoxFit.contain,
                                    height: 150, width: 150,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(launch.name, style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),),
                                    //
                                    Text('windows: ${launch.window
                                        .toString()}'),
                                    Text('flightNumber: ${launch
                                        .flightNumber.toString()}'),
                      
                                    //Text(launches[i].failures[0].reason),
                                    Row(
                                      children: [
                                        launch.success == true ? CustomButton(
                                          text: 'Success', color: Colors.green,) : CustomButton(
                                          color: Colors.red,
                                          text: 'Failure',),
                                        SizedBox(width: 5,),
                                        launch .fairingsReused != null ? CustomButton(text: 'Reused', color: Colors.grey,) : Text(''),
                      
                                      ],
                                    ),
                                    Text(launch.launchpad.toString()),
                                    Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(
                                        launch.dateUtc)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Text('Loading');
        });
  }
}