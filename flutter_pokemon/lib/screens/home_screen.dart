// pantalla home
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    PokemonProvider pokemonProvider = Provider.of<PokemonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'pokemonlogo.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                pokemonProvider.fetchPokemonList();
                Navigator.pushNamed(context, '/list');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5, // Altura de la sombra
              ),
              child: const Text(
                'Lista de Pokemons!',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
