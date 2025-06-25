import 'package:flutter/material.dart';
import 'package:state_smanagement/class/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterState counterState = CounterState();

  @override
  void initState() {
    counterState.addListener(callback);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    counterState.removeListener(callback);
  }

  void callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contador: ${counterState.count}'),
              ElevatedButton(
                onPressed: () {
                  counterState.counter();
                },
                child: Text('+1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
