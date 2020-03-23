import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/pages/home_page/home_controller.dart';
import 'package:provider/provider.dart';

class EvolutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);

    List<NextEvolution> nextEvolution = [];
    List<PrevEvolution> prevEvolution = [];

    if (homeController.pokemon.nextEvolution != null) {
      homeController.pokemon.nextEvolution
          .forEach((value) => {nextEvolution.add(value)});
    }

    if (homeController.pokemon.prevEvolution != null) {
      homeController.pokemon.prevEvolution
          .forEach((value) => {prevEvolution.add(value)});

    }

    return Column(
      children: <Widget>[
        Text("Evolution", style: TextStyle(color: Colors.black, fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            nextEvolution.length >=1 ? Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                height: 150,
                width: 150,
                placeholder: (context, url) => new Container(
                  color: Colors.transparent,
                ),
                imageUrl:
                    "${ConstsApi.pokeUrlImage}${nextEvolution[0].num}.png",
              ),
            ) : Container(),
            nextEvolution.length >= 2 ? Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                height: 150,
                width: 150,
                placeholder: (context, url) => new Container(
                  color: Colors.transparent,
                ),
                imageUrl:
                    "${ConstsApi.pokeUrlImage}${nextEvolution[1].num}.png",
              ),
            ) : Container(),
          ],
        ),
        SizedBox(height: 30,),
        Text("Pre Evolution", style: TextStyle(color: Colors.black, fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            prevEvolution.length >=1 ? Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                height: 150,
                width: 150,
                placeholder: (context, url) => new Container(
                  color: Colors.transparent,
                ),
                imageUrl:
                    "${ConstsApi.pokeUrlImage}${prevEvolution[0].num}.png",
              ),
            ) : Container(),
            prevEvolution.length >= 2 ? Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                height: 150,
                width: 150,
                placeholder: (context, url) => new Container(
                  color: Colors.transparent,
                ),
                imageUrl:
                    "${ConstsApi.pokeUrlImage}${prevEvolution[1].num}.png",
              ),
            ) : Container(),
          ],
        ),
      ],
    );
  }
}

// return Column(
//   children: <Widget>[
//     Text("Evolution", style: TextStyle(color: Colors.black, fontSize: 18)),
//     Container(
//       height: 200,
//       width: 200,
//       child: GridView.builder(
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: nextEvolution.length,
//         itemBuilder: (BuildContext context, int index) {
//           return CachedNetworkImage(
//             height: 150,
//             width: 150,
//             placeholder: (context, url) => new Container(
//               color: Colors.transparent,
//             ),
//             imageUrl:
//                 "${ConstsApi.pokeUrlImage}${nextEvolution[index].num}.png",
//           );
//         },
//       ),
//     )
//   ],
// );
