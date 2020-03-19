import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:provider/provider.dart';

class PokemonDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonP = Provider.of<Pokemon>(context,listen: false);

    // final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(title: Text(pokemonP.pokemon.name),),
    );
  }
}
