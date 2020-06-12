import 'package:flutter/material.dart';
import 'package:pokemonapp/model/pokemon_model.dart';
import 'package:pokemonapp/service/pokemon_service_api.dart';

class ListPokemon extends StatefulWidget {
  @override
  _ListPokemonState createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  List<PokemonModel> _pokemons = [];
  int _pageNumber = 1;
  bool _isSearch = false;
  _getPokemons(page) {
    _pokemons = [];
    PokemonServiceApi.getPokemons(page).then((pokemons) {
      setState(() {
        _pokemons.addAll(pokemons);
      });
    });
  }

  _getPokemon(name) {
    _pokemons = [];
    PokemonServiceApi.getPokemon(name).then((pokemons) {
      setState(() {
        if (name == '') {
          _isSearch = false;
          _pageNumber = 1;
          _getPokemons(1);
        } else {
          _isSearch = true;
        }
        _pokemons.addAll(pokemons);
      });
    });
  }

  _downPage() {
    if (_pageNumber == 0) {
      setState(() {
        _pageNumber = 0;
      });
    } else {
      setState(() {
        _pageNumber--;
      });
    }
    _getPokemons(_pageNumber);
  }

  _upPage() {
    if (_pageNumber == 123) {
      setState(() {
        _pageNumber = 123;
      });
    } else {
      setState(() {
        _pageNumber++;
      });
    }
    _getPokemons(_pageNumber);
  }

  @override
  void initState() {
    _getPokemons(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Rechercher un pokemon'),
          onChanged: (String value) {
            _getPokemon(value);
          },
        ),
        actions: !_isSearch
            ? <Widget>[
                IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      _downPage();
                    }),
                Center(
                  child: Text(
                    '$_pageNumber',
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      _upPage();
                    }),
              ]
            : null,
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
