//widget reutilizable para el registro individual
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/screens/screens.dart';

class IndividualPokemonScreen extends StatefulWidget {
  final Pokemon pokemon;

  const IndividualPokemonScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

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
    final colors = PokemonUtils.getCombinedTypeColors(widget.pokemon.types);

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
                '${widget.pokemon.name.toLowerCase()}.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                'Name: ${widget.pokemon.name}',
                style: TextStyle(
                  color: colors.length == 2 ? Colors.white : null,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Types: ${widget.pokemon.types.join(', ')}',
                style: TextStyle(
                  color: colors.length == 2 ? Colors.white : null,
                  fontSize: 16,
                ),
              ),
              Text(
                'Region: ${widget.pokemon.region}',
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
