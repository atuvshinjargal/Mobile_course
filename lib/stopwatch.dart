import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late int seconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    seconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    setState(() {
      seconds = seconds + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          '$seconds секунд',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
