import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonProvider extends ChangeNotifier {
  List<dynamic> _pokemonList = [];
  Map<String, dynamic> _pokemon = {};
  bool _isLoading = false;

  List<dynamic> get pokemonList => _pokemonList;

  Map<String, dynamic> get pokemon => _pokemon;

  // Getter para obtener el estado de carga
  bool get isLoading => _isLoading;

  Future<void> fetchPokemonList() async {
    try {
      _isLoading =
          true; // Establecer estado de carga a true antes de la solicitud
      notifyListeners();

      final String apiUrl =
          'https://apirender-express-pokemon.onrender.com/api/v1/pokemons/pokemons?api_key=123';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Guardar la lista de Pokémon
        _pokemonList = json.decode(response.body);
        notifyListeners();
      }
    } catch (e) {
      print('Error al obtener la lista de Pokémon: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPokemonDetails(int id) async {
    try {
      _isLoading = true;
      notifyListeners();

      final String apiUrl =
          'https://apirender-express-pokemon.onrender.com/api/v1/pokemons/pokemon/$id?api_key=123';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Guardar el Pokémon
        _pokemon = json.decode(response.body);
        notifyListeners();
      }
    } catch (e) {
      print('Error al obtener detalles del Pokémon: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
