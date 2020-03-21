import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailPage extends StatefulWidget {
  final int index;

  const PokemonDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  Pokemon pokemonP;

  HomeController homeController;

  PageController _pageController;

  int posicaoPokemon;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);

    // pokemonP = Provider.of<Pokemon>(context, listen: false);

    homeController = Provider.of<HomeController>(context, listen: false);

    homeController.posicaoPokemon = widget.index;

    super.initState();
  }

  Pokemon get pokemon => homeController.pokemon;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(pokemon.name),
            backgroundColor: ConstsApi.getColorType(type: pokemon.type[0]),
          ),
          backgroundColor: ConstsApi.getColorType(type: pokemon.type[0]),
          body: Stack(
            children: <Widget>[
              SlidingSheet(
                elevation: 8,
                cornerRadius: 16,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.7, 1.0],
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
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                    height: 150,
                    child: PageView.builder(
                      itemCount: homeController.pokemons.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        Pokemon pokemonP = homeController.pokemons[index];
                        homeController.setpokemon(pokemonP);
                      },
                      itemBuilder: (BuildContext context, int count) {
                        Pokemon pokemonP = homeController.pokemons[count];
                        return CachedNetworkImage(
                          height: 60,
                          width: 60,
                          placeholder: (context, url) => new Container(
                            color: Colors.transparent,
                          ),
                          imageUrl: "${pokemonP.img}",
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
