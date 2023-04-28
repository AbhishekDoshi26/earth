import 'package:earth/planet/planet.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.85,
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 49, 88, 116),
                    Color.fromARGB(255, 4, 11, 34),
                  ],
                  radius: 1,
                ),
              ),
            ),
          ),
          const _SplashScreenForm(),
        ],
      ),
    );
  }
}

class _SplashScreenForm extends StatefulWidget {
  const _SplashScreenForm();

  @override
  State<_SplashScreenForm> createState() => _SplashScreenFormState();
}

class _SplashScreenFormState extends State<_SplashScreenForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initialiseController();
  }

  void _initialiseController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )
      ..forward()
      ..addListener(
        () async {
          if (_controller.isCompleted) {
            await Future.delayed(const Duration(seconds: 3)).then((value) =>
                Navigator.of(context).pushReplacement(PlanetPage.route()));
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return AnimatedRotation(
            turns: _controller.value * 6,
            duration: const Duration(seconds: 3),
            curve: Curves.decelerate,
            child: SizedBox(
              height: _controller.value * 300,
              child: Image.asset('assets/logo.png'),
            ),
          );
        },
      ),
    );
  }
}
