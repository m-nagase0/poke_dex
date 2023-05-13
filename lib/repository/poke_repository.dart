import 'dart:convert';

import 'package:poke_picture_book/model/poke_model.dart';

import '../data/region_info.dart';
import '../data/search_type.dart';
import 'package:http/http.dart' as http;

class PokeRepository {
  static const base_url = "https://pokeapi.co/api/v2/pokemon/";
  static const maxNumber = 898;
  static const kanto_firstNumber = 1;
  static const kanto_endNumber = 151;
  static const johto_firstNumber = 152;
  static const johto_endNumber = 251;
  static const hoenn_firstNumber = 252;
  static const hoenn_endNumber = 386;
  static const sinnoh_firstNumber = 387;
  static const sinnoh_endNumber = 493;
  static const unova_firstNumber = 494;
  static const unova_endNumber = 649;
  static const kalos_firstNumber = 650;
  static const kalos_endNumber = 721;
  static const alola_firstNumber = 722;
  static const alola_endNumber = 807;
  static const galar_firstNumber = 808;
  static const galar_endNumber = 898;

  Future<List<Pokemon>> getPokeData(
      {required SearchType searchType, Region? region, String? keyword}) async {
    List<Pokemon> result = [];
    http.Response? response;

    switch (searchType) {
      case SearchType.all_poke:
        for (int index = 1; index <= 10; index++) {
          final requestUri = Uri.parse(base_url + "$index");
          response = await http.get(requestUri);
          if (response.statusCode == 200) {
            final responseBody = response.body;
            result.add(Pokemon.fromJson(jsonDecode(responseBody)));
          } else {
            throw Exception('Failed to fetch pokemon data');
          }
        }
        break;

      case SearchType.region:
        // TODO: Handle this case.
        if (region?.regionId == 0) {
          for (int index = 1; index <= maxNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              // result = Pokemon.fromJson(jsonDecode(responseBody!)) as List<Pokemon>;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch image URL');
            }
          }
        } else if (region?.regionId == 1) {
          for (int index = kanto_firstNumber; index <= kanto_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 2) {
          for (int index = johto_firstNumber; index <= johto_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 3) {
          for (int index = hoenn_firstNumber; index <= hoenn_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 4) {
          for (int index = sinnoh_firstNumber; index <= sinnoh_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 5) {
          for (int index = unova_firstNumber; index <= unova_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 6) {
          for (int index = kalos_firstNumber; index <= kalos_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 7) {
          for (int index = alola_firstNumber; index <= alola_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 8) {
          for (int index = galar_firstNumber; index <= galar_endNumber; index++) {
            final requestUri = Uri.parse(base_url + "$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        }
        break;
      case SearchType.keyword:
        // TODO: Handle this case.
        final requestUri = Uri.parse(base_url + "$keyword");
        response = await http.get(requestUri);
        if (response.statusCode == 200) {
          final responseBody = response.body;
          result.add(Pokemon.fromJson(jsonDecode(responseBody)));
        } else {
          throw Exception('Failed to fetch pokemon data');
        }
        break;
    }
    print(result);
    return result;
  }
}
