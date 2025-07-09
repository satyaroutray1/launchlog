import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';

class LaunchModel extends LaunchEntity {
  const LaunchModel({required super.id, required super.name, required super.dateUtc,
    required super.success, required super.imageUrl, required super.details,
    required super.window, required super.flightNumber, required super.fairingsReused,
  required super.launchpad});
  
  factory LaunchModel.fromJson(Map<String, dynamic> json){
    return LaunchModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      success: json['success'],
      dateUtc: DateTime.parse(json['date_utc']),
      imageUrl: json['links']?['patch']?['small'],
      details: json['details'],
      window: json['window'],
      flightNumber: json['flight_number'],
      fairingsReused: json['fairings']?['reused'] ,
      launchpad: json['launchpad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'success': success,
      'date_utc': dateUtc.toIso8601String(),
      'links': {
        'patch': {
          'small': imageUrl,
        }
      },
      'details': details,
      'window': window,
      'flight_number': flightNumber,
      'fairings': {
        'reused': fairingsReused,
      },
      'launchpad': launchpad,
    };
  }
}