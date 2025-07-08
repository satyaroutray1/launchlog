import 'package:equatable/equatable.dart';

class LaunchEntity extends Equatable{
  final String id;
  final String name;
  final bool? success;
  final DateTime dateUtc;
  final String? imageUrl;
  final String? details;

  const LaunchEntity({
    required this.id,
    required this.name,
    required this.success,
    required this.dateUtc,
    required this.imageUrl,
    required this.details,
  });

  @override
  List<Object?> get props => [id, name, success, dateUtc, imageUrl, details];

}