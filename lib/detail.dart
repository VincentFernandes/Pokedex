import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:pokeapp/model/pokemonDetail.dart';
import 'package:hexcolor/hexcolor.dart';

class PokemonDetailPage extends StatelessWidget {

  PokemonDetailPage({Key key, this.pokemonDetail, this.pokemonName})
      : super(key: key);
  final PokemonDetail pokemonDetail;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {

    Map colorsTemplate = {
      'bug': Color.fromARGB(255, 198, 209, 110),
      'dark': Color.fromARGB(255, 162, 146, 136),
      'dragon': Color.fromARGB(255, 162, 125, 250),
      'electric': Color.fromARGB(255, 250, 224, 120),
      'fairy': Color.fromARGB(255, 244, 189, 201),
      'fighting': Color.fromARGB(255, 214, 120, 115),
      'fire': Color.fromARGB(255, 245, 172, 120),
      'flying': Color.fromARGB(255, 198, 183, 245),
      'ghost': Color.fromARGB(255, 162, 146, 188),
      'grass': Color.fromARGB(255, 167, 219, 141),
      'ground': Color.fromARGB(255, 235, 214, 157),
      'ice': Color.fromARGB(255, 188, 230, 230),
      'normal': Color.fromARGB(255, 198, 198, 167),
      'poison': Color.fromARGB(255, 193, 131, 193),
      'psychic': Color.fromARGB(255, 250, 146, 178),
      'rock': Color.fromARGB(255, 209, 193, 125),
      'steel': Color.fromARGB(255, 209, 209, 224),
      'water': Color.fromARGB(255, 157, 183, 245),
    };

    Map colorsAbility = {
      'overgrow': HexColor("78C850"),
      'chlorophyll': HexColor("78C850"),
      'blaze': HexColor("F08030"),
      'solar-power': HexColor("F08030"),
      'torrent': HexColor("6890F0"),
      'rain-dish': HexColor("6890F0"),
      'shield-dust': HexColor("6890F0"),
      'run-away': HexColor("A8A878"),
      'shed-skin': HexColor("A8B820"),
      'compound-eyes': HexColor("A8B820"),
      'tinted-lens': HexColor("A8B820"),
      'swarm': HexColor("A8B820"),
      'sniper': HexColor("6890F0"),
      'keen-eye': HexColor("A890F0"),
      'tangled-feet': HexColor("A8A878"),
      'big-pecks': HexColor("F8D030"),
      'guts': HexColor("A8A878"),
      'hustle': HexColor("F08030"),
      'intimidate': HexColor("F08030"),
      'unnerve': HexColor("20A048"),
      'static': HexColor("F8D030"),
      'lightning-rod': HexColor("F8D030"),
      'sand-veil': HexColor("E0C068"),
      'sand-rush': HexColor("E0C068"),
      'poison-point': HexColor("A040A0"),
      'rivalry': HexColor("7038F8"),
      'sheer-force': HexColor("C03028"),
      'cute-charm': HexColor("EE99AC"),
      'magic-guard': HexColor("F85888"),
      'friend-guard': HexColor("EE99AC"),
      'unaware': HexColor("A8A878"),
      'flash-fire': HexColor("F08030"),
      'competitive': HexColor("6890F0"),
      'frisk': HexColor("C86890"),
      'drought': HexColor("F08030"),
      'inner-focus': HexColor("C03028"),
      'infiltrator': HexColor("A890F0"),
      'stench': HexColor("A040A0"),
      'effect-spore': HexColor("78C850"),
      'dry-skin': HexColor("6890F0"),
      'damp': HexColor("6890F0"),
      'wonder-skin': HexColor("8C888C"),
      'arena-trap': HexColor("E0C068"),
      'sand-force': HexColor("E0C068"),
      'pickup': HexColor("C86890"),
      'technician': HexColor("A8A878"),
      'limber': HexColor("F8D030"),
      'cloud-nine': HexColor("A8A878"),
      'swift-swim': HexColor("6890F0"),
      'vital-spirit': HexColor("8C888C"),
      'anger-point': HexColor("F08030"),
      'defiant': HexColor("F08030"),
      'justified': HexColor("C03028"),
      'synchronize': HexColor("F85888"),
      'water-absorb': HexColor("6890F0"),
      'no-guard': HexColor("C03028"),
      'steadfast': HexColor("C03028"),
      'gluttony': HexColor("20A048"),
      'clear-body': HexColor("B8B8D0"),
      'liquid-ooze': HexColor("A040A0"),
      'rock-head': HexColor("B8A038"),
      'sturdy': HexColor("B8A038"),
      'flame-body': HexColor("F08030"),
      'oblivious': HexColor("F85888"),
      'own-tempo': HexColor("F85888"),
      'regenerator': HexColor("FF0000"),
      'magnet-pull': HexColor("B8B8D0"),
      'analytic': HexColor("A8A878"),
      'early-bird': HexColor("A890F0"),
      'hydration': HexColor("6890F0"),
      'ice-body': HexColor("98D8D8"),
      'thick-fat': HexColor("F08030"),
      'sticky-hold': HexColor("A040A0"),
      'poison-touch': HexColor("A040A0"),
      'power-of-alchemy': HexColor("8C888C"),
      'shell-armor': HexColor("6890F0"),
      'skill-link': HexColor("A8A878"),
      'overcoat': HexColor("A8B820"),
      'levitate': HexColor("A890F0"),
      'cursed-body': HexColor("F85888"),
      'weak-armor': HexColor("B8A038"),
      'insomnia': HexColor("8C888C"),
      'forewarn': HexColor("F85888"),
      'soundproof': HexColor("A8A878"),
      'aftermath': HexColor("A040A0"),
      'harvest': HexColor("20A048"),
      'battle-armor': HexColor("B8A038"),
      'reckless': HexColor("C92112"),
      'unburden': HexColor("F85888"),
      'iron-fist': HexColor("C03028"),
      'neutralizing-gas': HexColor("A040A0"),
      'hyper-cutter': HexColor("F08030"),
      'natural-cure': HexColor("78C850"),
      'serene-grace': HexColor("A8A878"),
      'healer': HexColor("A8A878"),
      'leaf-guard': HexColor("78C850"),
      'scrappy': HexColor("A8A878"),
      'water-veil': HexColor("6890F0"),
      'illuminate': HexColor("F8D030"),
      'screen-cleaner': HexColor("F85888"),
      'mold-breaker': HexColor("B8A038"),
      'moxie': HexColor("F08030"),
      'rattled': HexColor("A8A878"),
      'filter': HexColor("F85888"),
      'imposter': HexColor("A8A878"),
      'anticipation': HexColor("C03028"),
      'volt-absorb': HexColor("F8D030"),
      'quick-feet': HexColor("F85888"),
      'trace': HexColor("F85888"),
      'download': HexColor("F08030"),
      'pressure': HexColor("7038F8"),
      'adaptability': HexColor("6890F0"),
      'immunity': HexColor("A040A0"),
      'snow-cloak': HexColor("98D8D8"),
      'marvel-scale': HexColor("F8D030"),
      'multiscale': HexColor("A890F0"),
    };

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(pokemonName),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: pokemonDetail.svg == null
                ? Image.network(pokemonDetail.spriteUrl1)
                : SvgPicture.network(pokemonDetail.svg,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(40.0),
                        child: const CircularProgressIndicator()),
                    width: (MediaQuery.of(context).size.width * 0.55),
                    height: (MediaQuery.of(context).size.width * 0.55)),
          ),
          ListTile(
            title: Center(
              child: Text(
                '#' + pokemonDetail.id.toString().padLeft(3,'0'),
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Flexo',
                    color: Colors.white
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: Center(
              child: Text(pokemonName,
                  style:
                      TextStyle(fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Flexo',
                          color: Colors.white
                      )),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 2),
            child: Center(
              child: Text('( Species ' + pokemonDetail.species + ' )',
                  style:
                  TextStyle(fontSize: 24,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Flexo',
                      color: Colors.white
                  )),
            ),
          ),
          Divider(),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.deepOrange,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Types',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Flexo',
                          color: Colors.white
                      )),
                  Tags(
                    itemCount: pokemonDetail.types.length,
                    itemBuilder: (int index) {
                      var item = pokemonDetail.types[index];
                      return ItemTags(
                          onPressed: (item) => {},
                          onLongPressed: (item) => {},
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          index: index,
                          title: item,
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Flexo',
                              fontWeight: FontWeight.normal
                          ),
                        activeColor: colorsTemplate[item],
                        textActiveColor: Colors.white,
                        textColor: Colors.white,
                        color: colorsTemplate[item],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.deepOrange,
            elevation: 5,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, bottom: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        '( Weight ' +
                            (pokemonDetail.weight / 10).toString() +
                            ' kg )',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Flexo',
                            color: Colors.white
                        )),
                    Text(
                        '( Height ' +
                            (pokemonDetail.height / 10).toString() +
                            ' m )',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Flexo',
                            color: Colors.white
                        )),
                  ],
                )),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.deepOrange,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 5, left: 20, top: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text('Abilities : ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Flexo',
                            color: Colors.white
                        )),
                  ),
                  Tags(
                    itemCount: pokemonDetail.abilities.length,
                    itemBuilder: (int index) {
                      var item = pokemonDetail.abilities[index];
                      return ItemTags(
                          onPressed: (item) => {},
                          onLongPressed: (item) => {},
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          index: index,
                          title: item,
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Flexo',
                              color: Colors.white
                          ),
                        activeColor: colorsAbility[item],
                        textActiveColor: Colors.white,
                        textColor: Colors.white,
                        color: colorsAbility[item],
                        elevation: 0,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.deepOrange,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 5, left: 20, top: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text('Moves : ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Flexo',
                            color: Colors.white
                        )),
                  ),
                  Tags(
                    itemCount: pokemonDetail.moves.length,
                    itemBuilder: (int index) {
                      var item = pokemonDetail.moves[index];
                      return ItemTags(
                          onPressed: (item) => {},
                          onLongPressed: (item) => {},
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          index: index,
                          title: item,
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Flexo',
                              color: Colors.white
                          ),
                        activeColor: HexColor("193A6F"),
                        textActiveColor: Colors.white,
                        textColor: Colors.white,
                        color: HexColor("193A6F"),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getMovesWidgets(List<String> strings) {
  List<Widget> list = new List<Widget>();
  list.add(Text('Abilities : ',
      style: TextStyle(
          fontSize: 24,
          fontFamily: 'Flexo',
          fontWeight: FontWeight.bold
      )));
  list.add(Divider());
  for (var i = 0; i < strings.length; i++) {
    list.add(Text(strings[i],
        style: TextStyle(
            fontSize: 24,
            fontFamily: 'Flexo',
            fontWeight: FontWeight.bold
        )));
  }
  return new Column(children: list);
}
