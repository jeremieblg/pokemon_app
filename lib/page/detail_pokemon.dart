import 'package:flutter/material.dart';
import 'package:pokemonapp/model/pokemon_model.dart';

class DetailPokemon extends StatefulWidget {
  @override
  _DetailPokemonState createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF1744),
        title: Text('${pokemon.name}'),
        actions: <Widget>[
          Center(
            child: Text(
              '${pokemon.id}',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: 30.0,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Center(
              child: Container(
                width: 300,
                height: 500,
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
                    Container(height: 20.0),
                    Image.network(
                      '${pokemon.imageUrl}',
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(width: 25),
                          Text('${pokemon.rarity}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Spacer(flex: 1),
                          Text('${pokemon.hp}Pv',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Container(width: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
