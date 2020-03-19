import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:pokemon/pages/home_page/home_page.dart';
import 'package:pokemon/pages/pokemon_detail/pokemon_detail_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokeAPI>(
          create: (_) => PokeAPI(),
        ),
        Provider<Pokemon>(
          create: (_) => Pokemon(),
        ),
        Provider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => HomePage(), 
          '/pokemon-detail' : (context) => PokemonDetailPage()
        },
      ),
    );
  }
}
