import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/consts/consts_images.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:provider/provider.dart';

class PokeItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokeItem({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.only(right: 7, left: 7, top: 7, bottom: 7),
      child: Container(
          decoration: BoxDecoration(
              color: ConstsApi.getColorType(type: pokemon.type[0]),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: <Widget>[
              Positioned(
                right: 0,
                bottom: 0,
                child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      ConstsImages.imagePokeball,
                      color: Colors.white,
                      height: 130,
                      width: 130,
                    )),
              ),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: CachedNetworkImage(
                    imageUrl: "${pokemon.img}",
                    placeholder: (context, url) => new Container(
                      color: Colors.transparent,
                    ),
                  )),
            ],
          )),
    );
  }
}
