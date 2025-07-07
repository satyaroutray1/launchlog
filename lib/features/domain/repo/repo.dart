
import 'package:launchlog/features/domain/entity/launches_entity.dart';

abstract class LaunchRepo {
  Future<List<LaunchEntity>> fetchData();
}