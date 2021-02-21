import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:pokeapp/pokeapi_provider.dart';

import 'detail.dart';
import 'gridview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'P@kedex',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Flexo',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'P@kedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('P@kedex'),
        actions: [searchBar.getSearchAction(context)]);
  }

  _MyHomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: (text) async {
          String _name = '${text[0].toUpperCase()}${text.substring(1)}';
          try {
            var pokemon = await getPokemonByName(text);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(
                        pokemonDetail: pokemon,
                        pokemonName: _name,
                      )),
            );
          } catch (e) {
            _showMyDialog(context, text);
          }
        },
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: searchBar.build(context),
      body: Center(
        child: GridViewWidget(),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext ctx, String text) async {
  return showDialog<void>(
    context: ctx,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Pokemon Not Found'),
        content: SingleChildScrollView(
          child: Text(
            'Pokemon with provided name "' +
                text +
                '" not found. Try another name',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
