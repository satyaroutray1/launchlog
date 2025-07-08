
import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';

abstract class LaunchRepo {
  Future<List<LaunchEntity>> fetchData();
}