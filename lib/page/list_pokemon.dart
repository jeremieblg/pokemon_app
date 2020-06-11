import 'package:flutter/material.dart';
import 'package:pokemonapp/model/pokemon_model.dart';
import 'package:pokemonapp/service/pokemon_service_api.dart';

class ListPokemon extends StatefulWidget {
  @override
  _ListPokemonState createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  List<PokemonModel> _pokemons = [];

  _getPokemons() {
    PokemonServiceApi.getPokemons().then((pokemons) {
      setState(() {
        _pokemons.addAll(pokemons);
      });
    });
  }

  @override
  void initState() {
    _getPokemons();
    print('test');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Bourg Palette'),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1.0,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/detail_pokemon',
                    arguments: PokemonModel(
                      id: '${_pokemons[position].id}',
                      name: '${_pokemons[position].name}',
                      imageUrl: '${_pokemons[position].imageUrl}',
                      hp: '${_pokemons[position].hp}',
                      rarity: '${_pokemons[position].rarity}',
                    ),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Text('${_pokemons[position].name}'),
                    Image.network(
                      '${_pokemons[position].imageUrl}',
                      width: 150.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _pokemons.length,
      ),
    );
  }
}
