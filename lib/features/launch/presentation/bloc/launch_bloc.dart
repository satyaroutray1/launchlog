
import 'package:bloc/bloc.dart';
import 'package:launchlog/features/launch/domain/usecase/usecase.dart';

import 'launch_event.dart';
import 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {

  LaunchUseCase launchUseCase;

  LaunchBloc(this.launchUseCase) : super(LaunchInitial()) {
    on<LaunchEvent>(onLoadEvent);
  }

  onLoadEvent(LaunchEvent event, Emitter emit) async {
    emit(LaunchLoading());
    //
    // final response = await http.get(Uri.parse(Constants.allLaunchesUrl));
    //
    // List<Launches> launches = (json.decode(response.body) as List).map((json) =>
    //     Launches.fromJson(json)).toList();

    try {
      final a = await launchUseCase();
      print(a);
      emit(DataAvailable(launches: a));
    }catch (e){
      emit(Error(error: e.toString()));
    }
  }
}
