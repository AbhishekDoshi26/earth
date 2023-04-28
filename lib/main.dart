import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'planet/planet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planet',
      home: const PlanetPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.workSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
