import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:pokemon/pages/pokemon_detail/widgets/text_about.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    Pokemon pokemon = homeController.pokemon;

    return Padding(
      padding: const EdgeInsets.only(top:10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Description",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: "google"),
          ),
          SizedBox(height: 10,),
          TextAbout(description: "heigth ", text: pokemon.height),
          TextAbout(description: "weight ", text: pokemon.weight),
          TextAbout(description: "candy ", text: pokemon.candy),
          TextAbout(description: "egg ", text: pokemon.egg),
        ],
      ),
    );
  }
}
