import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';
import 'package:launchlog/features/launch/domain/repo/repo.dart';

class LaunchUseCase {
  final LaunchRepo launchRepo;

  LaunchUseCase({required this.launchRepo});

  Future<List<LaunchEntity>> call() async {
    return await launchRepo.fetchData();
  }
}