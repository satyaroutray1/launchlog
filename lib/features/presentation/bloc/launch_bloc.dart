import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants.dart';
import 'launch_event.dart';
import 'launch_state.dart';
import 'package:launchlog/features/data/model/launches.dart';


class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc() : super(LaunchInitial()) {
    on<LaunchEvent>(onLoadEvent);

  }
  onLoadEvent(LaunchEvent event, Emitter emit) async {

    emit(LaunchLoading());

    final response = await http.get(Uri.parse(Constants.allLaunchesUrl));

    List<Launches> launches = (json.decode(response.body) as List).map((json) =>
        Launches.fromJson(json)).toList();
    emit(DataAvailable(launches: launches));
  }
}
