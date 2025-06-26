import 'package:flutter/material.dart';
import 'package:state_smanagement/contracts/observeble.dart';

class ObservebleBuilder extends StatefulWidget {
  final Observeble observeble;
  final Widget Function(BuildContext context) contexto;
  const ObservebleBuilder({
    super.key,
    required this.observeble,
    required this.contexto,
  });

  @override
  State<ObservebleBuilder> createState() => _ObservebleBuilderState();
}

class _ObservebleBuilderState extends State<ObservebleBuilder> {
  @override
  void initState() {
    widget.observeble.addListener(rebuild);
    super.initState();
  }

  void rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.observeble.removeListener(rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.contexto(context);
  }
}
