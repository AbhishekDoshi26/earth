part of 'planet_bloc.dart';

enum PlanetStatus {
  initial,
  loading,
  loaded,
}

class PlanetState extends Equatable {
  const PlanetState({
    required this.isInteracting,
    required this.status,
  });

  static PlanetState initial() => const PlanetState(
        isInteracting: false,
        status: PlanetStatus.initial,
      );

  final bool isInteracting;
  final PlanetStatus status;

  PlanetState copywith({
    bool? isInteracting,
    PlanetStatus? status,
  }) {
    return PlanetState(
      isInteracting: isInteracting ?? this.isInteracting,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [isInteracting, status];
}
