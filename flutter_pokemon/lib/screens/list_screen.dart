//lista de registros
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/screens/screens.dart';

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String region;
  bool isFavorite;
  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.region,
    this.isFavorite = false,
  });
}

class PokemonUtils {
  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'poison':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  static List<Color> getCombinedTypeColors(List<String> types) {
    return types.map((type) => getTypeColor(type)).toList();
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Pokemon> pokemons = [
    Pokemon(
      id: 1,
      name: 'Bulbasaur',
      types: ['Grass', 'Poison'],
      region: 'Kanto',
    ),
    Pokemon(
      id: 2,
      name: 'Charmander',
      types: ['Fire'],
      region: 'Kanto',
    ),
    Pokemon(
      id: 3,
      name: 'Squirtle',
      types: ['Water'],
      region: 'Kanto',
    ),
  ];

  TextEditingController _typeController = TextEditingController();

  List<Pokemon> _filteredPokemons = [];

  @override
  void initState() {
    super.initState();
    _filteredPokemons = List.from(pokemons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Column(
        children: [
          // TextFormField para filtrar por tipo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _typeController,
              decoration: InputDecoration(
                labelText: 'Filter by Type',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // Limpiar el campo de texto y restaurar la lista completa de Pokémon
                    setState(() {
                      _typeController.clear();
                      _filteredPokemons = List.from(pokemons);
                    });
                  },
                ),
              ),
              onChanged: (value) {
                // Filtrar la lista de Pokémon por tipo
                setState(() {
                  _filteredPokemons = pokemons
                      .where((pokemon) => pokemon.types.any((type) =>
                          type.toLowerCase().contains(value.toLowerCase())))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPokemons.length,
              itemBuilder: (BuildContext context, int index) {
                final pokemon = _filteredPokemons[index];
                PokemonUtils.getCombinedTypeColors(pokemon.types);
                return ListTile(
                  title: Row(
                    children: [
                      Image.asset(
                        '${pokemon.name.toLowerCase()}.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Types: ${pokemon.types.join(', ')}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Region: ${pokemon.region}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualPokemonScreen(
                          pokemon: pokemon,
                        ),
                      ),
                    );
                  },
                  contentPadding: const EdgeInsets.all(10),
                  dense: true,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
