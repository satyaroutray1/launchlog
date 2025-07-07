import 'package:launchlog/features/domain/entity/launches_entity.dart';
import 'package:launchlog/features/domain/repo/repo.dart';

class LaunchUseCase {
  final LaunchRepo launchRepo;

  LaunchUseCase({required this.launchRepo});

  Future<List<LaunchEntity>> call() async {
    return await launchRepo.fetchData();
  }
}