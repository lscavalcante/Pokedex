import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/consts/consts_images.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:pokemon/pages/pokemon_detail/pokemon_detail_controller.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailPage extends StatefulWidget {
  final int index;

  const PokemonDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {

  HomeController homeController;

  PageController _pageController;

  PokemonDetailController pokemonDetailController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);

    // pokemonP = Provider.of<Pokemon>(context, listen: false);

    pokemonDetailController = PokemonDetailController();

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
                listener: (state) =>
                    pokemonDetailController.controlImagePokemon(state),
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
                    height: 200,
                    child: PageView.builder(
                      itemCount: homeController.pokemons.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        Pokemon pokemonP = homeController.pokemons[index];
                        homeController.setpokemon(pokemonP);
                      },
                      itemBuilder: (BuildContext context, int count) {
                        Pokemon pokemonP = homeController.pokemons[count];
                        return Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Hero(
                                child: Opacity(
                                  child: Image.asset(
                                    ConstsImages.imagePokeball,
                                    height: 260,
                                    width: 260,
                                    color: Colors.white,
                                  ),
                                  opacity: 0.2,
                                ),
                                tag: count.toString()),
                            Observer(builder: (_) {
                              return Opacity(
                                child: CachedNetworkImage(
                                  height: 200,
                                  width: 200,
                                  placeholder: (context, url) => new Container(
                                    color: Colors.transparent,
                                  ),
                                  imageUrl: "${pokemonP.img}",
                                ),
                                opacity: pokemonDetailController.opacidade,
                              );
                            }),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
