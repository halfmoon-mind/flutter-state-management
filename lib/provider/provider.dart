import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'provider_model.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (_) => CounterModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Provider Example"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Consumer<CounterModel>(
                  builder: (context, counterModel, child) {
                    return Text(
                      '${counterModel.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<CounterModel>(context, listen: false).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
