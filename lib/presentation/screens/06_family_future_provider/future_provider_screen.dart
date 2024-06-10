import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;
  @override
  Widget build(BuildContext context) {
    final nombrePokemon = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon con id: $pokemonId'),
      ),
      body: Center(
        child: nombrePokemon.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              pokemonId = pokemonId + 1;

              setState(() {});
            },
          ),
          const SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon(Icons.exposure_minus_1_rounded),
            onPressed: () {
              if (pokemonId > 1) {
                pokemonId = pokemonId - 1;

                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
