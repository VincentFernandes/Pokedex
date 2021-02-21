class PokemonDetail {
  String spriteUrl1;
  String spriteUrl2;
  String svg;
  String species;

  int height;
  int weight;
  int id;

  List<String> abilities;
  List<String> types;
  List<String> moves;

  PokemonDetail(
      {this.spriteUrl1,
      this.spriteUrl2,
      this.svg,
      this.species,
      this.height,
      this.weight,
      this.id,
      this.abilities,
      this.types,
      this.moves});

  factory PokemonDetail.imgFromJson(Map<String, dynamic> json) {
    return PokemonDetail(
        spriteUrl1: json['sprites']['front_default'],
        spriteUrl2: json['sprites']['front_shiny'],
        svg: json['sprites']['other']['dream_world']['front_default']);
  }

  factory PokemonDetail.detailFromJson(Map<String, dynamic> json) {
    List<String> _abilities = (json['abilities'] as List)
        .map((data) => data['ability']['name'].toString())
        .toList();

    List<String> _moves = (json['moves'] as List)
        .map((data) => data['move']['name'].toString())
        .toList();

    List<String> _types = (json['types'] as List)
        .map((data) => data['type']['name'].toString())
        .toList();

    return PokemonDetail(
        spriteUrl1: json['sprites']['front_default'],
        spriteUrl2: json['sprites']['front_shiny'],
        svg: json['sprites']['other']['dream_world']['front_default'],
        species: json['species']['name'],
        height: json['height'],
        weight: json['weight'],
        id: json['id'],
        abilities: _abilities,
        moves: _moves,
        types: _types);
  }
}