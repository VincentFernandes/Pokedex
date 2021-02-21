import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/detail.dart';
import 'package:pokeapp/model/pokemon.dart';
import 'package:pokeapp/pokeapi_provider.dart';
import 'package:hexcolor/hexcolor.dart';

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  Future<List<Pokemon>> futurePokemons;

  @override
  void initState() {
    super.initState();
    futurePokemons = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Pokemon>>(
        future: futurePokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var pokemon = snapshot.data[index];
                return FutureBuilder(
                  future: pokemon.getImgUrl(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var pokemonDetail = snapshot.data;
                      return Card(
                        color: HexColor("F2F2F2"),
                       // elevation: 5,
                        child: InkWell(
                          onTap: () async {
                            var futurePokemon =
                                await pokemon.getPokemonDetail();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokemonDetailPage(
                                        pokemonDetail: futurePokemon,
                                        pokemonName: pokemon.name,
                                      )),
                            );
                          },
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  child: pokemonDetail.svg == null
                                      ? Image.network(pokemonDetail.spriteUrl1)
                                      : SvgPicture.network(pokemonDetail.svg,
                                          placeholderBuilder: (BuildContext
                                                  context) =>
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(
                                                          40.0),
                                                  child:
                                                      const CircularProgressIndicator()),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70) /
                                              2,
                                          height: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70) /
                                              2)),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Center(
                                  child: Text(
                                    pokemon.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Flexo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                // color: Colors.lightBlue,
                              )
                            ],
                          )),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
