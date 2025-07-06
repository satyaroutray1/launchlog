import 'package:equatable/equatable.dart';
import 'package:launchlog/model/launches.dart';

class LaunchState extends Equatable{
  final List<Launches> launches;

  const LaunchState({this.launches = const []});

  LaunchState copyWith({List<Launches>? launches}){
    return LaunchState(launches: launches ?? this.launches);
  }

  @override
  List<Object?> get props => [launches];
}

//final class LaunchInitial extends LaunchState {}

// class DataAvailable extends LaunchState {
//
//   final List<Launches> launches;
//   DataAvailable({required this.launches});
//
// }