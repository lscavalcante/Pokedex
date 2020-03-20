import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/consts/consts_images.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:pokemon/pages/home_page/widgets/app_bar_widget.dart';
import 'package:pokemon/pages/home_page/widgets/poke_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = new HomeController();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double statustop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: _body(width),
    );
  }

  _body(width) {
    //utlizando provider global
    final controller = Provider.of<HomeController>(context);

    if (controller.pokemons.length == 0) {
      controller.fetchPokemon(context);
    }

    return Stack(
      alignment: Alignment.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: -(270 / 5),
          left: width - (270 / 1.6),
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              ConstsImages.imagePokeball,
              height: 270,
              width: 270,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            AppBarWidget(),
            Expanded(
              child: Observer(builder: (_) {
                return AnimationLimiter(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(5),
                    addAutomaticKeepAlives: true,
                    itemCount: controller.pokemons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      Pokemon pokemon = controller.pokemons[index];
                      return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: 2,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            child: GestureDetector(
                              child: GestureDetector(
                                child: PokeItem(pokemon: pokemon),
                                onTap: () {
                                  //utilizando contrutor
                                  // final pokemonP = Provider.of<Pokemon>(context,
                                  //     listen: false);
                                  // pokemonP.setPokemon(pokemon);

                                  Navigator.pushNamed(
                                      context, '/pokemon-detail');
                                  //utilizando o provider global
                                  controller.setpokemon(pokemon);
                                },
                              ),
                            ),
                          ));
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ],
    );
  }
}
