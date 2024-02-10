//widget reutilizable para el registro individual
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

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
      case 'electric':
        return Colors.amber;
      case 'ground':
        return Colors.brown;
      case 'psychic':
        return Colors.pink;
      case 'rock':
        return Colors.brown;
      case 'ice':
        return Colors.lightBlue;
      case 'fighting':
        return Colors.orange;
      case 'flying':
        return Colors.cyan;
      case 'normal':
        return const Color.fromARGB(255, 231, 139, 170);
      case 'fairy':
        return Colors.pink;

      default:
        return Colors.grey;
    }
  }

  static List<Color> getCombinedTypeColors(List<dynamic> types) {
    return types.map((type) => getTypeColor(type)).toList();
  }
}

class IndividualPokemonScreen extends StatefulWidget {
  const IndividualPokemonScreen({Key? key}) : super(key: key);

  @override
  _IndividualPokemonScreenState createState() =>
      _IndividualPokemonScreenState();
}

class _IndividualPokemonScreenState extends State<IndividualPokemonScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PokemonProvider pokemonProvider = Provider.of<PokemonProvider>(context);
    Map<String, dynamic> pokemon = pokemonProvider.pokemon;
    final colors =
        PokemonUtils.getCombinedTypeColors(pokemonProvider.pokemon["type"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details'),
      ),
      body: Container(
        color: colors.length == 1 ? colors[0] : null,
        decoration: colors.length == 2
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  stops: const [0.5, 0.5],
                ),
              )
            : null,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '${pokemon['name'].toLowerCase()}.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                'Name: ${pokemon['name']}',
                style: TextStyle(
                  color: colors.length == 2 ? Colors.white : null,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Types: ${pokemon["type"].join(', ')}',
                style: TextStyle(
                  color: colors.length == 2 ? Colors.white : null,
                  fontSize: 16,
                ),
              ),
              Text(
                'Region: ${pokemon["region"]}',
                style: TextStyle(
                  color: colors.length == 2 ? Colors.white : null,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
