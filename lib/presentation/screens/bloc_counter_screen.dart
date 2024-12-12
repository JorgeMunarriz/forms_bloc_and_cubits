import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatefulWidget {
  const BlocCounterScreen({super.key});

  @override
  State<BlocCounterScreen> createState() => _BlocCounterScreenState();
}

class _BlocCounterScreenState extends State<BlocCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });
  void increasedCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increseadBy(value);
  }

  void resetCounter(
    BuildContext context,
  ) {
    // context.read<CounterBloc>();
    context.read<CounterBloc>().resetCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('Bloc counter ${counterBloc.state.transactionCount}');
        }),
        actions: [
          IconButton(
            // onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            onPressed: () => context.read<CounterBloc>().resetCounter(),
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
          child: context.select((CounterBloc counterBloc) =>
              Text('Counter value : ${counterBloc.state.counter}'))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+1'),
            onPressed: () => increasedCounterBy(context),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increasedCounterBy(context, 2),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () => increasedCounterBy(context, 3),
          ),
        ],
      ),
    );
  }
}
