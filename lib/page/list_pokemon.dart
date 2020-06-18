import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pokemonapp/model/pokemon_model.dart';
import 'package:pokemonapp/service/pokemon_service_api.dart';

class ListPokemon extends StatefulWidget {
  @override
  _ListPokemonState createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  List<PokemonModel> _pokemons = [];
  int _pageNumber = 1;
  bool _isLoading = false;
  bool _isSearch = false;
  _getPokemons(page) {
    _pokemons = [];
    _isLoading = true;
    print("true");

    PokemonServiceApi.getPokemons(page).then((pokemons) {
      setState(() {
        _pokemons.addAll(pokemons);
        print(_pokemons);
      });
    }).then((value) {
      setState(() {
        _isLoading = false;
        print("false");
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
    if (_pageNumber == 1) {
      setState(() {
        _pageNumber = 1;
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
        backgroundColor: Color(0xFFFF1744),
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Rechercher un pokemon',
            hintStyle: TextStyle(color: Colors.white),
          ),
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
      body: GridView.builder(
        padding: EdgeInsets.only(top: 25.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, position) {
          return MaterialButton(
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(bottom: 35.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '${_pokemons[position].name}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(height: 5.0),
                  _cardPokemon(position),
                ],
              ),
            ),
          );
        },
        itemCount: _pokemons.length,
      ),
    );
  }

  Widget _cardPokemon(position) {
    if (_isLoading) {
      print("loading");
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/loader.gif'), fit: BoxFit.cover),
        ),
      );
    } else if (_pokemons[position].imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: _pokemons[position].imageUrl,
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      );
    } else {
      return Text(
        'not Loading',
        textAlign: TextAlign.center,
      );
    }
  }
}
