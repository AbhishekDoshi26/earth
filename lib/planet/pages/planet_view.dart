import 'package:earth/planet/planet.dart';
import 'package:earth/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetView extends StatelessWidget {
  const PlanetView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((PlanetBloc bloc) => bloc.state.status);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            SizedBox(
              height: context.height,
              width: context.width,
              child: Image.network(
                StringConstants.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Opacity(
              opacity: 0.85,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Color.fromARGB(255, 49, 88, 116),
                    Color.fromARGB(255, 4, 11, 34),
                  ], radius: 1),
                ),
              ),
            ),
            Positioned(
              top: context.padding.top + 32,
              left: 32,
              right: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        "It's time to explore Earth 🌎",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (status == PlanetStatus.loading)
              Align(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: const Offset(0, 80),
                  child: const StarLoader(
                    color: Color(0xffffd700),
                    size: 80,
                  ),
                ),
              ),
            const HomePlanetWidget(),
          ],
        ),
      ),
    );
  }
}
