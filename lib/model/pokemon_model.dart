class PokemonModel {
  String id;
  String name;
  String imageUrl;
  String hp;
  String rarity;

  PokemonModel({this.id, this.name, this.imageUrl, this.hp, this.rarity});
  PokemonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        hp = json['hp'],
        rarity = json['rarity'];

  @override
  String toString() {
    return 'PokemonModel{id: $id, name: $name, imageUrl: $imageUrl, hp: $hp, rarity: $rarity}';
  }

/*factory PokemonModel.fromJson(Map<String, dynamic> json) {
    PokemonModel pokemonModel = PokemonModel(json['file'].toString());
    return pokemonModel;
  }*/
}
