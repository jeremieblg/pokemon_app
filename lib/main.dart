import 'package:flutter/material.dart';
import 'package:pokemonapp/routes/routes.dart';

void main() {
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/list_pokemon',
      routes: routes,
    );
  }
}
