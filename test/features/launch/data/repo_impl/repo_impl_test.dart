import 'package:flutter_test/flutter_test.dart';
import 'package:launchlog/features/launch/data/model/launches_model.dart';
import 'package:launchlog/features/launch/data/repo_impl/repo_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockLaunchRepo extends Mock implements LaunchRepoImpl {}

void main() {
  final mockLaunchRepo = MockLaunchRepo();
  final launches =
    LaunchModel(id: '5eb87cd9ffd86e000604b32a', name: 'FalconSat', success: false,
        dateUtc: DateTime.parse("2006-03-24T22:30:00.000Z"),
        imageUrl: 'https://images2.imgbox.com/94/f2/NN6Ph45r_o.png',
        details: 'Engine failure at 33 seconds and loss of vehicle');

  test('repo', () async {
   final repo = mockLaunchRepo;
    when(() => mockLaunchRepo.fetchData()).thenAnswer((_) async => [launches]);
    final result = await repo.fetchData();
    expect(result, [launches]);
  });
}