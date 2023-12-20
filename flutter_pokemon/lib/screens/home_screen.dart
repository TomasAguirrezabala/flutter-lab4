// pantalla home
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo Pokemon
            Image.asset(
              'pokemonlogo.png',
              width: 300,
              height: 300,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color de fondo del botón
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Bordes redondeados
                ),
                elevation: 5, // Altura de la sombra
              ),
              child: const Text(
                'Lista de Pokemons!',
                style: TextStyle(
                  color: Colors.black, // Color del texto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
