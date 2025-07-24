import 'package:http/http.dart' as http;
import 'package:launchlog/features/launch/data/repo_impl/repo_impl.dart';
import 'package:launchlog/features/launch/domain/repo/repo.dart';

import 'features/launch/domain/usecase/usecase.dart';
import 'features/launch/presentation/bloc/launch_bloc.dart';
import 'main.dart';


Future<void> setup() async {

  // Bloc
  sl.registerFactory<LaunchBloc>(() => LaunchBloc(sl()));

  // Use cases
  sl.registerLazySingleton<LaunchUseCase>(() => LaunchUseCase(launchRepo: sl()));

  // Repository
  sl.registerLazySingleton<LaunchRepo>(() => LaunchRepoImpl(client: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
