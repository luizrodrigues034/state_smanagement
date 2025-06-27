import 'package:flutter/material.dart';
import 'package:state_smanagement/builders/observable_state_builder.dart';
import 'package:state_smanagement/builders/observeble_builder.dart';
import 'package:state_smanagement/class/counter_state.dart';
import 'package:state_smanagement/controllers/change_state.dart';
import 'package:state_smanagement/controllers/state_oberseble.dart';
import 'package:state_smanagement/mixins/change_state_mixin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ChangeStateMixin {
  StateOberseble observableState = StateOberseble(0);
  CounterState counterState = CounterState();

  @override
  void initState() {
    useChangeState(counterState);
    useChangeState(observableState);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('valor do counterState: ${counterState.count}'),
              ElevatedButton(
                onPressed: () {
                  counterState.counter();
                },
                child: Text('add +1'),
              ),
              Text('valor do observableState: ${observableState.state}'),
              ElevatedButton(
                onPressed: () {
                  observableState.state++;
                },
                child: Text('add +1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
