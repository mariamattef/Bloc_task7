import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/cubit/counter/counter_cubit.dart';
import 'package:test_flutter/cubit/counter/counter_state.dart';
import 'package:test_flutter/widgets/employee_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) => Center(
              child: Text(
            '${state.count}',
            style: const TextStyle(fontSize: 30),
          )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
