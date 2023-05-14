import 'package:flutter/material.dart';
import 'package:poke_picture_book/data/region_info.dart';
import 'package:poke_picture_book/data/search_type.dart';
import 'package:poke_picture_book/model/poke_model.dart';
import 'package:poke_picture_book/view/components/poke_tile.dart';
import 'package:poke_picture_book/view/components/region_chips.dart';
import 'package:poke_picture_book/view/components/search_poke_bar.dart';
import 'package:poke_picture_book/view/poke_individual_page.dart';
import 'package:poke_picture_book/viewmodel/poke_data_view_model.dart';
import 'package:provider/provider.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<PokeDataViewModel>();
    if (!viewModel.isLoading) {
      Future(() => viewModel.getPokeData(
          searchType: SearchType.region, region: regions[0]));
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => onRefresh(context),
          tooltip: "更新",
          child: const Icon(Icons.refresh),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              //TODO 検索バー
              SearchPokeBar(
                searchPoke: (pokeName) => getPokeWord(context, pokeName),
              ),
              //TODO カテゴリーチップ
              RegionChips(
                  onRegionSelected: (region) => getRegionData(context, region)),
              Expanded(
                child: Consumer<PokeDataViewModel>(
                  builder: (context, model, child) {
                    return model.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: model.pokemon.length,
                            itemBuilder: (context, int position) {
                              return PokeTile(
                                pokemon: model.pokemon[position],
                                onPokeTileClicked: (pokemon) =>
                                    _openPokeInfo(pokemon, context),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    final viewModel = context.read<PokeDataViewModel>();
    await viewModel.getPokeData(
        searchType: viewModel.searchType,
        region: viewModel.region,
        keyword: viewModel.keyword);
  }

  Future<void> getPokeWord(BuildContext context, pokeName) async {
    final viewModel = context.read<PokeDataViewModel>();
    await viewModel.getPokeData(
        searchType: SearchType.keyword, keyword: pokeName);
  }

  Future<void> getRegionData(BuildContext context, Region region) async {
    final viewModel = context.read<PokeDataViewModel>();
    await viewModel.getPokeData(searchType: SearchType.region, region: region);
  }

  // TODO ポケモン詳細画面
  _openPokeInfo(Pokemon pokemon, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PokeIndividualPage(pokemon: pokemon)));
  }
}
