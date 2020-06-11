import 'package:flutter/material.dart';
import 'package:pokemonapp/page/detail_pokemon.dart';
import 'package:pokemonapp/page/list_pokemon.dart';

Map<String, WidgetBuilder> routes = {
  '/list_pokemon': (_) {
    return ListPokemon();
  },
  '/detail_pokemon': (context) {
    return DetailPokemon();
  },
};
