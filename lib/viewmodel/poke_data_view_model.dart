import 'package:flutter/material.dart';
import 'package:poke_picture_book/data/region_info.dart';
import 'package:poke_picture_book/data/search_type.dart';
import 'package:poke_picture_book/model/poke_model.dart';
import 'package:poke_picture_book/repository/poke_repository.dart';

class PokeDataViewModel extends ChangeNotifier {
  final PokeRepository _repository = PokeRepository();

  SearchType _searchType = SearchType.all_poke;
  SearchType get searchType => _searchType;

  Region _region = regions[0];
  Region get region => _region;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Pokemon> _pokemon = [];
  List<Pokemon> get pokemon => _pokemon;

  Future<void> getPokeData ({required SearchType searchType, Region? region, String? keyword}) async{
    //TODO
    _searchType = searchType;
    _region = region ?? regions[0];
    _keyword = keyword ?? "";

    _isLoading = true;
    notifyListeners();

    _pokemon = await _repository.getPokeData(searchType: _searchType, region: _region, keyword: _keyword);

    _isLoading = false;
    notifyListeners();
  }

}