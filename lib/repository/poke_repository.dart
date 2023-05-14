import 'dart:convert';

import 'package:poke_picture_book/model/poke_model.dart';

import '../data/region_info.dart';
import '../data/search_type.dart';
import 'package:http/http.dart' as http;

class PokeRepository {
  static const baseUrl = "https://pokeapi.co/api/v2/pokemon/";
  static const maxNumber = 898;
  static const kantoFirstNumber = 1;
  static const kantoEndNumber = 151;
  static const johtoFirstNumber = 152;
  static const johtoEndNumber = 251;
  static const hoennFirstNumber = 252;
  static const hoennEndNumber = 386;
  static const sinnohFirstNumber = 387;
  static const sinnohEndNumber = 493;
  static const unovaFirstNumber = 494;
  static const unovaEndNumber = 649;
  static const kalosFirstNumber = 650;
  static const kalosEndNumber = 721;
  static const alolaFirstNumber = 722;
  static const alolaEndNumber = 807;
  static const galarFirstNumber = 808;
  static const galarEndNumber = 898;

  Future<List<Pokemon>> getPokeData(
      {required SearchType searchType, Region? region, String? keyword}) async {
    List<Pokemon> result = [];
    http.Response? response;

    switch (searchType) {

      case SearchType.region:
        // TODO: Handle this case.
        if (region?.regionId == 0) {
          for (int index = kantoFirstNumber; index <= 10; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 1) {
          for (int index = johtoFirstNumber; index <= johtoEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 2) {
          for (int index = hoennFirstNumber; index <= hoennEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 3) {
          for (int index = sinnohFirstNumber; index <= sinnohEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 4) {
          for (int index = unovaFirstNumber; index <= unovaEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 5) {
          for (int index = kalosFirstNumber; index <= kalosEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 6) {
          for (int index = alolaFirstNumber; index <= alolaEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
            response = await http.get(requestUri);
            if (response.statusCode == 200) {
              final responseBody = response.body;
              result.add(Pokemon.fromJson(jsonDecode(responseBody)));
            } else {
              throw Exception('Failed to fetch pokemon data');
            }
          }
        } else if (region?.regionId == 7) {
          for (int index = galarFirstNumber; index <= galarEndNumber; index++) {
            final requestUri = Uri.parse("$baseUrl$index");
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
        final requestUri = Uri.parse("$baseUrl$keyword");
        response = await http.get(requestUri);
        if (response.statusCode == 200) {
          final responseBody = response.body;
          result.add(Pokemon.fromJson(jsonDecode(responseBody)));
        } else {
          throw Exception('Failed to fetch pokemon data');
        }
        break;
    }
    return result;
  }
}
