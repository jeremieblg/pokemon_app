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
        title: Text('${pokemon.name}'),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    '${pokemon.imageUrl}',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 1),
                    Row(
                      children: <Widget>[
                        Container(width: 50.0),
                        Text(
                          '${pokemon.name}',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(flex: 1),
                        Text('${pokemon.id}',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold)),
                        Container(width: 50.0),
                      ],
                    ),
                    Spacer(flex: 1),
                    Row(
                      children: <Widget>[
                        Container(width: 50.0),
                        Text('${pokemon.hp}Pv',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold)),
                        Spacer(flex: 1),
                        Text('${pokemon.rarity}',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold)),
                        Container(width: 50.0),
                      ],
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            )
          ],
        ),

        /*Text('${pokemon.name}'),
          Text('${pokemon.id}'),
          Text('${pokemon.hp}'),
          Text('${pokemon.rarity}'),
          Image.network(
            '${pokemon.imageUrl}',
          )*/
      ),
    );
  }
}
