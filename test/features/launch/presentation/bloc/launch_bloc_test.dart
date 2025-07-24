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
      LaunchEntity(id: '5eb87cd9ffd86e000604b32a', name: 'FalconSat', success: false,
          dateUtc: DateTime.parse("2006-03-24T22:30:00.000Z"),
          imageUrl: 'https://images2.imgbox.com/94/f2/NN6Ph45r_o.png',
          details: 'Engine failure at 33 seconds and loss of vehicle',window: 0,
          flightNumber: 1, fairingsReused: false, launchpad: '5e9e4502f5090995de566f86')
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
      verify: (_) {
        verify(() => mockUseCase()).called(1);
      },
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

      verify: (_) {
        verify(() => mockUseCase()).called(1);
      },
    );
  });
}