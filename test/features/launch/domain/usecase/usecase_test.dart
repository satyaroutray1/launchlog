import 'package:flutter_test/flutter_test.dart';
import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';
import 'package:launchlog/features/launch/domain/repo/repo.dart';
import 'package:launchlog/features/launch/domain/usecase/usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements LaunchRepo {}

void main() {
  final mockRepo = MockRepo();
  final launches = [
    LaunchEntity(id: '5eb87cd9ffd86e000604b32a', name: 'FalconSat', success: false,
        dateUtc: DateTime.parse("2006-03-24T22:30:00.000Z"),
        imageUrl: 'https://images2.imgbox.com/94/f2/NN6Ph45r_o.png',
        details: 'Engine failure at 33 seconds and loss of vehicle',window: 0, flightNumber: 1,
    fairingsReused: false, launchpad: '5e9e4502f5090995de566f86')
  ];

  test('description', () async {

    final useCase = LaunchUseCase(launchRepo: mockRepo);
    when(() => mockRepo.fetchData()).thenAnswer((_) async => launches);
    final result = await useCase();
    expect(result, launches);
  });
}