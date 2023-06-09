import 'package:earth/planet/planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const PlanetPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanetBloc(),
      child: const PlanetView(),
    );
  }
}
