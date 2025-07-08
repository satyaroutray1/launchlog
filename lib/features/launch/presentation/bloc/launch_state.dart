import 'package:equatable/equatable.dart';
import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';

class LaunchState extends Equatable{

  @override
  List<Object?> get props => [];
}

class LaunchInitial extends LaunchState {}

class LaunchLoading extends LaunchState {}

class DataAvailable extends LaunchState {

  final List<LaunchEntity> launches;
  DataAvailable({required this.launches});
}

class Error extends LaunchState {

  final String error;
  Error({required this.error});
}