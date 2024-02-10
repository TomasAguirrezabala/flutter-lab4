import 'package:flutter/material.dart';
import 'package:flutter_pokemon/providers/pokemon_provider.dart';
import 'package:flutter_pokemon/screens/screens.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  ListScreen();

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PokemonProvider pokemonProvider = Provider.of<PokemonProvider>(context);

    // Función para filtrar la lista de Pokémon por nombre
    List<Map<String, dynamic>> filteredPokemonList() {
      String searchTerm = _searchController.text.toLowerCase();
      List<Map<String, dynamic>> filteredList = [];

      for (var pokemon in pokemonProvider.pokemonList) {
        if (pokemon['name'].toString().toLowerCase().contains(searchTerm)) {
          filteredList.add(pokemon);
        }
      }

      return filteredList;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Buscar Pokémon por nombre',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();

                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                return await pokemonProvider.fetchPokemonList();
              },
              child: ListView.builder(
                itemCount: filteredPokemonList().length,
                itemBuilder: (context, index) {
                  var pokemon = filteredPokemonList()[index];
                  var nombre = pokemon['name'];

                  return ListTile(
                    leading: Image.asset(
                      '${pokemon['name'].toLowerCase()}.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text('$nombre'),
                    onLongPress: () async {
                      try {
                        await pokemonProvider
                            .fetchPokemonDetails(pokemon['id']);
                        // Verificar si los datos se cargaron correctamente
                        if (pokemonProvider.pokemon.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const IndividualPokemonScreen(),
                            ),
                          );
                        } else {
                          // Maneja el caso donde los datos no se cargaron correctamente
                          print('Error: Datos del Pokémon no disponibles');
                        }
                      } catch (error) {
                        // Manejar errores durante la carga de datos
                        print('Error al obtener detalles del Pokémon: $error');
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
