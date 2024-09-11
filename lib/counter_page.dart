import 'package:bloc_pattern_flutter/counter_bloc.dart';
import 'package:bloc_pattern_flutter/counter_event.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                _counterBloc.counterEventSink.add(IncrementEvent());
              },
              tooltip: 'Increment',
              child: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(width: 20),
            StreamBuilder(
              initialData: 0,
              stream: _counterBloc.counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  snapshot.data.toString(),
                );
              },
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                _counterBloc.counterEventSink.add(DecrementEvent());
              },
              tooltip: 'Decrement',
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
