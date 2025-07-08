import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:launchlog/features/launch/domain/entity/launches_entity.dart';
import 'package:launchlog/features/launch/domain/usecase/usecase.dart';
import 'package:launchlog/features/launch/presentation/bloc/launch_bloc.dart';
import 'package:launchlog/features/launch/presentation/bloc/launch_event.dart';
import 'package:launchlog/features/launch/presentation/bloc/launch_state.dart';
import 'package:mocktail/mocktail.dart';

class MockUseCase extends Mock implements LaunchUseCase { }

void main() {

  group('description', (){

    final mockUseCase = MockUseCase();
    final launches = [
      LaunchEntity(id: '1', name: 'name', success: false,
        dateUtc: DateTime.now(), imageUrl: 'imageUrl', details: 'details'),
    ];

    blocTest<LaunchBloc, LaunchState>(
      'bloc test',
      build: () => LaunchBloc(mockUseCase),

      setUp: (){
        when(() => mockUseCase()).thenAnswer((_) async => launches);
      },

      act: (bloc) {
        bloc.add(LaunchEvent());
        return bloc;
      },

      expect: () => <LaunchState>[
        LaunchLoading(),
        DataAvailable(launches: launches),
      ],
    );


    blocTest<LaunchBloc, LaunchState>(
      'bloc error',
      build: () => LaunchBloc(mockUseCase),

      setUp: (){
        when(() => mockUseCase()).thenThrow(Exception('error'));
      },

      act: (bloc) {
        bloc.add(LaunchEvent());
        return bloc;
      },

      expect: () => <LaunchState>[
        LaunchLoading(),
        Error(error: 'error')
      ],
    );
  });
}