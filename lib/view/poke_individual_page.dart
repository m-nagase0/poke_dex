import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_picture_book/model/poke_model.dart';
import 'package:poke_picture_book/view/components/ability_chips.dart';
import 'package:poke_picture_book/view/components/looks_chips.dart';
import 'package:poke_picture_book/view/components/types_chips.dart';
import 'package:poke_picture_book/viewmodel/change_looks_view_model.dart';
import 'package:provider/provider.dart';

class PokeIndividualPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokeIndividualPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ChangeLooksViewModel>();

    List pokeImages = [
      pokemon.imageUrl?.front_default,
      pokemon.imageUrl?.back_default,
      pokemon.imageUrl?.front_shiny,
      pokemon.imageUrl?.back_shiny,
    ];

    return WillPopScope(
      onWillPop: () {
        viewModel.imageNumber = 0;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              pokemon.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Consumer<ChangeLooksViewModel>(
                  builder: (context, model, child) {
                    return CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: pokeImages[viewModel.imageNumber],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "No.${pokemon.id}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Name:${pokemon.name}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    const Text(
                      "Types",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TypeChips(pokemon: pokemon),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ability",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  AbilityChips(pokemon: pokemon),
                ],
              ),
              LooksChips(
                pokemon: pokemon,
                onLooksChipSelected: (index) => changePokeImage(context, index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changePokeImage(BuildContext context, index) async {
    final viewModel = context.read<ChangeLooksViewModel>();
    await viewModel.changePokeImage(index: index);
  }
}
