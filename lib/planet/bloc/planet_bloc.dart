import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planet_event.dart';
part 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  PlanetBloc() : super(PlanetState.initial()) {
    on<PlanetInteractionStarted>(_onPlanetInteractionStarted);
    on<PlanetLoaded>(_onPlanetLoaded);
  }

  void _onPlanetInteractionStarted(
    PlanetInteractionStarted event,
    Emitter<PlanetState> emit,
  ) {
    emit(
      state.copywith(
        isInteracting: !state.isInteracting,
        status: PlanetStatus.loading,
      ),
    );
  }

  void _onPlanetLoaded(
    PlanetLoaded event,
    Emitter<PlanetState> emit,
  ) {
    emit(state.copywith(status: PlanetStatus.loaded));
  }
}
