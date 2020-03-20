import 'package:flutter/material.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final pokemonP = Provider.of<Pokemon>(context, listen: false);

    final homeController = Provider.of<HomeController>(context);

    Pokemon pokemon = homeController.pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: ConstsApi.getColorType(type: pokemon.type[0]),
      ),
      body: Stack(
      children: <Widget>[
        Container(color: ConstsApi.getColorType(type: pokemon.type[0])),
        SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.7, 1.0],
            // Define to what the snappings relate to. In this case, 
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text('This is the content of the sheet'),
              ),
            );
          },
        )
      ],
    ),
    );
  }
}
