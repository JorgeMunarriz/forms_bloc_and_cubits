import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatefulWidget {
  const CubitCounterScreen({super.key});

  @override
  State<CubitCounterScreen> createState() => _CubitCounterScreenState();
}

class _CubitCounterScreenState extends State<CubitCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increadeBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit counterCubic) {
          return Text('Cubit counter: ${counterCubic.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: const Icon(
              Icons.refresh_outlined,
            ),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value : ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context, 1),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3),
          ),
        ],
      ),
    );
  }
}
