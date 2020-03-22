import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/consts/consts_images.dart';
import 'package:pokemon/models/choice.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:pokemon/pages/pokemon_detail/pokemon_detail_controller.dart';
import 'package:pokemon/pages/pokemon_detail/widgets/about_page.dart';
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

  Choice choice;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);

    pokemonDetailController = PokemonDetailController();

    homeController = Provider.of<HomeController>(context, listen: false);

    homeController.posicaoPokemon = widget.index;

    choice = Choice();

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
                  return DefaultTabController(
                    child: Column(
                      children: <Widget>[
                        pokemonDetailController.opacidade == 1
                            ? Container(height: 20)
                            : Container(),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              TabBar(
                                indicatorColor: Colors.black,
                                tabs: pokemonDetailController.choices
                                    .map((Choice choice) {
                                  return Tab(
                                    // text: choice.title,
                                    icon: Icon(choice.icon),
                                    child: Text(
                                      choice.title,
                                      style: TextStyle(
                                          color: ConstsApi.getColorType(
                                              type: pokemon.type[0])),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Expanded(
                                child: TabBarView(children: [
                                  AboutPage(),
                                  Icon(Icons.movie),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    length: pokemonDetailController.choices.length,
                  );
                },
              ),
              pokemonDetailController.opacidade == 1
                  ? Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 45.0),
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
                                          height: 150,
                                          width: 150,
                                          color: Colors.white,
                                        ),
                                        opacity: 0.2,
                                      ),
                                      tag: count.toString()),
                                  Observer(builder: (_) {
                                    return Opacity(
                                      child: CachedNetworkImage(
                                        height: 150,
                                        width: 150,
                                        placeholder: (context, url) =>
                                            new Container(
                                          color: Colors.transparent,
                                        ),
                                        imageUrl: "${pokemonP.img}",
                                      ),
                                      opacity:
                                          pokemonDetailController.opacidade,
                                    );
                                  }),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
