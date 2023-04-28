part of 'planet_bloc.dart';

@immutable
abstract class PlanetEvent extends Equatable {
  const PlanetEvent();

  @override
  List<Object?> get props => [];
}

class PlanetInteractionStarted extends PlanetEvent {
  const PlanetInteractionStarted();
}

class PlanetLoaded extends PlanetEvent {
  const PlanetLoaded();
}
