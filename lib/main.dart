import 'package:flutter/material.dart';
import 'package:state_smanagement/builders/observable_state_builder.dart';
import 'package:state_smanagement/builders/observeble_builder.dart';
import 'package:state_smanagement/class/counter_state.dart';
import 'package:state_smanagement/controllers/change_state.dart';
import 'package:state_smanagement/controllers/state_oberseble.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StateOberseble observableState = StateOberseble(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ObservableStateBuilder(
                stateOberseble: observableState,
                build: (context, state, chield) {
                  return Column(
                    children: [Text('valor do counterState: $state'), chield],
                  );
                },
                child: ElevatedButton(
                  onPressed: () {
                    observableState.state++;
                  },
                  child: Text('add 1'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
