import 'package:flutter_test/flutter_test.dart';
import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';
import 'package:launchlog/features/launch/domain/repo/repo.dart';
import 'package:launchlog/features/launch/domain/usecase/usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements LaunchRepo {}

void main() {
  final mockRepo = MockRepo();
  final launches = [
    LaunchEntity(id: '1', name: 'name', success: false,
        dateUtc: DateTime.now(), imageUrl: 'imageUrl', details: 'details'),
  ];

  test('description', () async {

    final useCase = LaunchUseCase(launchRepo: mockRepo);
    when(() => mockRepo.fetchData()).thenAnswer((_) async => launches);
    final result = await useCase();
    expect(result, launches);
  });
}