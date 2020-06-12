import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemonapp/model/pokemon_model.dart';

class PokemonServiceApi {
  static final String baseUrl = "https://api.pokemontcg.io/v1";
  static Future<List<PokemonModel>> getPokemons(page) async {
    var url = baseUrl + '/cards?page=' + page.toString();
    print(url);
    var response = await http.get(url);
    Map<String, dynamic> responseJSON = jsonDecode(response.body);

    List<PokemonModel> pokemons = List<PokemonModel>.from(
        responseJSON["cards"].map((e) => PokemonModel.fromJson(e)).toList());

    /*await DefaultCacheManager().downloadFile(pokemonModel.file);*/
    /*await Future.delayed(Duration(seconds: 2));*/
    return pokemons;
  }

  static Future<List<PokemonModel>> getPokemon(name) async {
    var url = baseUrl + '/cards?name=' + name;
    var response = await http.get(url);
    Map<String, dynamic> responseJSON = jsonDecode(response.body);

    List<PokemonModel> pokemons = List<PokemonModel>.from(
        responseJSON["cards"].map((e) => PokemonModel.fromJson(e)).toList());

    /*await DefaultCacheManager().downloadFile(pokemonModel.file);*/
    /*await Future.delayed(Duration(seconds: 2));*/
    return pokemons;
  }
}
