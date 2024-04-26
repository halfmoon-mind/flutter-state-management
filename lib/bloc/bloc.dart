import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterState {
  final int value;
  CounterState(this.value);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.increment:
          emit(CounterState(state.value + 1));
          break;
        case CounterEvent.decrement:
          emit(CounterState(state.value - 1));
          break;
      }
    });
  }
}

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bloc Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  'Counter Value: ${state.value}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'incrementBtn',
            onPressed: () =>
                context.read<CounterBloc>().add(CounterEvent.increment),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrementBtn',
            onPressed: () =>
                context.read<CounterBloc>().add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
