import 'package:earth/planet/planet.dart';
import 'package:earth/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePlanetWidget extends StatelessWidget {
  const HomePlanetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isInteracting =
        context.select((PlanetBloc bloc) => bloc.state.isInteracting);

    return Positioned(
      top: context.height / (!isInteracting ? 3 : 5),
      child: GestureDetector(
        onTap: () {
          context.read<PlanetBloc>().add(const PlanetInteractionStarted());
        },
        child: PlanetElement(
          key: Key(isInteracting.toString()),
          interative: isInteracting,
        ),
      ),
    );
  }
}
