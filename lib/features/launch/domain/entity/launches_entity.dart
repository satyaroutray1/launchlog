import 'package:equatable/equatable.dart';

class LaunchEntity extends Equatable{
  final String id;
  final String name;
  final bool? success;
  final DateTime dateUtc;
  final String? imageUrl;
  final String? details;
  final int? window;
  final int? flightNumber;
  final bool? fairingsReused;
  final String? launchpad;

  const LaunchEntity({
    required this.id,
    required this.name,
    required this.success,
    required this.dateUtc,
    required this.imageUrl,
    required this.details,
    required this.window,
    required this.flightNumber,
    required this.fairingsReused,
    required this.launchpad
  });

  @override
  List<Object?> get props => [id, name, success, dateUtc, imageUrl,
    details, window, flightNumber, fairingsReused, launchpad];

}

