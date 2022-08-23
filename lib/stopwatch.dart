import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';

import 'model/user.dart';
import 'platform_alert.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';

  const StopWatch({
    Key? key,
  }) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int millisecond = 0;
  late Timer timer;
  bool toolohEseh = false;
  final laps = <int>[];

  @override
  void initState() {
    super.initState();
    millisecond = 0;
  }

  void _onTick(Timer timer) {
    if (toolohEseh) {
      setState(() {
        millisecond = millisecond + 100;
      });
    }
  }

  void _startTimer() {
    if (toolohEseh == false) {
      laps.clear();
      timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
      setState(() {
        millisecond = 0;
        toolohEseh = true;
      });
    }
  }

  void _stopTimer() {
    if (toolohEseh == true) {
      timer.cancel();
      setState(() {
        //millisecond = 0;
        toolohEseh = false;
      });
      final totalTime = laps.fold(millisecond, (int total, lap) => total + lap);
      final alert = PlatformAlert(
          title: 'Амжилттай дууслаа',
          message: 'Нийт $totalTime милл секунд боллоо.');
      alert.show(context);
    }
  }

  String _secondText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds секунд';
  }

  void _lap() {
    if (toolohEseh) {
      //true esehiig shalgaj baina.
      setState(() {
        laps.add(millisecond);
        millisecond = 0;
      });
    }
  }

  @override
  void dispose() {
    if (toolohEseh) {
      timer.cancel();
    }
    super.dispose();
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Тойрог ${laps.length + 1}',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            _secondText(millisecond),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _startTimer,
                child: Text('Эхлүүлэх'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: _lap,
                child: Text('Тойрог'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.yellow,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: _stopTimer,
                child: Text('Зогсоох'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLapDisplay() {
    return ListView(
      children: [
        for (int milliseconds in laps)
          ListTile(
            title: Text(
              _secondText(milliseconds),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch - ${user.name}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }
}
