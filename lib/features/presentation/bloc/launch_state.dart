import 'package:equatable/equatable.dart';
import 'package:launchlog/features/data/model/launches.dart';

class LaunchState extends Equatable{

  @override
  List<Object?> get props => [];
}

class LaunchInitial extends LaunchState {}
class LaunchLoading extends LaunchState {}

class DataAvailable extends LaunchState {

  final List<Launches> launches;
  DataAvailable({required this.launches});
}